set :application, "ccp"
set :repository,  "git@github.com:ccastillop/ccp.git"
set :deploy_via, :remote_cache
set :branch, "master"
set :ssh_options, { :forward_agent => true }
set :user, "ccastillo"

set :deploy_to, "/home/#{user}/apps/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false

server "cristiancastillo.com", :web, :app, :db, primary: true
default_run_options[:pty] = true
ssh_options[:forward_agent] = true

set :rvm_ruby_string, "1.9.3"
set :rvm_install_pkgs, %w[libyaml openssl]

before 'deploy:setup', 'rvm:install_rvm'   # install RVM
before 'deploy:setup', 'rvm:install_pkgs'  # install RVM packages before Ruby
before 'deploy:setup', 'rvm:install_ruby'  # install Ruby and create gemset, or:

after 'deploy:restart', 'unicorn:reload' # app IS NOT preloaded
after 'deploy:restart', 'unicorn:restart'  # app preloaded
after "deploy", "deploy:cleanup" # keep only the last 5 releases

task :setup_config, roles: :app do
  sudo "ln -nfs #{current_path}/config/nginx.conf /etc/nginx/sites-enabled/#{application}"
  run "mkdir -p #{shared_path}/config"
  put File.read("config/database.example.yml"), "#{shared_path}/config/database.yml"
  puts "Now edit the config files in #{shared_path}."
end
after "deploy:setup", "deploy:setup_config"

task :symlink_config, roles: :app do
  run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
end
after "deploy:finalize_update", "deploy:symlink_config"

desc "Make sure local git is in sync with remote."
task :check_revision, roles: :web do
  unless `git rev-parse HEAD` == `git rev-parse origin/master`
    puts "WARNING: HEAD is not the same as origin/master"
    puts "Run `git push` to sync changes."
    exit
  end
end
before "deploy", "deploy:check_revision"


require "bundler/capistrano"
require 'capistrano-unicorn'
require "rvm/capistrano"