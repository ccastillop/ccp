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
server "softwarebajodemanda.com", :web, :app, :db, primary: true

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

set :rvm_ruby_string, '1.9.3-p392'

require "bundler/capistrano"
require 'capistrano-unicorn'
require "capistrano-rbenv"
set :rbenv_ruby_version, "1.9.3-p392"

after "deploy", "deploy:cleanup" # keep only the last 5 releases

after "deploy:setup", "deploy:setup_config"
after "deploy:finalize_update", "deploy:symlink_config"
before "deploy", "deploy:check_revision"

namespace :deploy do

  task :setup_config, roles: :app do
    sudo "ln -nfs #{current_path}/config/nginx.conf /etc/nginx/sites-enabled/#{application}"
    run "mkdir -p #{shared_path}/config"
    #run "mkdir -p #{shared_path}/db"
    #run "touch #{shared_path}/db/production.sqlite3"
    put File.read("config/database.example.yml"), "#{shared_path}/config/database.yml"
    puts "Now edit the config files in #{shared_path}."
    sudo "service nginx restart"
    #poniendo unicorn en el init.d para inicio automatico
    put File.read("config/unicorn_init.sh"), "#{shared_path}/config/unicorn_init.sh"
    sudo "cp #{shared_path}/config/unicorn_init.sh /etc/init.d/unicorn_#{application}"
    sudo "chmod +x /etc/init.d/unicorn_#{application}"
    sudo "update-rc.d unicorn_#{application} defaults"
    #variables de configuracion
    put File.read("config/application.example.yml"), "#{shared_path}/config/application.yml"
  end

  task :symlink_config, roles: :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    run "ln -nfs #{shared_path}/config/application.yml #{release_path}/config/application.yml"
    #run "ln -nfs #{shared_path}/db/production.sqlite3 #{release_path}/db/production.sqlite3"
  end

  desc "Make sure local git is in sync with remote."
  task :check_revision, roles: :web do
    unless `git rev-parse HEAD` == `git rev-parse origin/master`
      puts "WARNING: HEAD is not the same as origin/master"
      puts "Run `git push` to sync changes."
      exit
    end
  end

end
