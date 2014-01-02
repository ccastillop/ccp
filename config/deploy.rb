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
#server "softwarebajodemanda.com", :web, :app, :db, primary: true

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

require "bundler/capistrano"
require 'capistrano-unicorn'
require "capistrano-rbenv"
set :rbenv_ruby_version, "2.0.0-p247"

after "deploy", "deploy:cleanup" # keep only the last 5 releases

after "deploy:setup", "deploy:setup_config"
after "deploy:finalize_update", "deploy:symlink_config"
before "deploy", "deploy:check_revision"
after "deploy", "unicorn:restart"

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

  namespace :ckeditor do
    desc 'Create nondigest versions of some ckeditor assets (e.g. moono skin png)'
    task :create_nondigest_assets do
      fingerprint = /\-[0-9a-f]{32}\./
      for file in Dir['public/assets/ckeditor/contents-*.css', 'public/assets/ckeditor/skins/moono/*.png']
        next unless file =~ fingerprint
        nondigest = file.sub fingerprint, '.' # contents-0d8ffa186a00f5063461bc0ba0d96087.css => contents.css
        FileUtils.cp file, nondigest, verbose: true
      end
    end
  end

  # # auto run ckeditor:create_nondigest_assets after assets:precompile
  # Rake::Task['assets:precompile'].enhance do
  #   Rake::Task['ckeditor:create_nondigest_assets'].invoke
  # end

  desc 'copy ckeditor nondigest assets'
  task :copy_nondigest_assets, roles: :app do
    run "cd #{latest_release} && #{rake} RAILS_ENV=#{rails_env} ckeditor:create_nondigest_assets"
  end
  after 'deploy:assets:precompile', 'copy_nondigest_assets'

end
