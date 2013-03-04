set :application, "ccp"
set :repository,  "git@github.com:ccastillop/ccp.git"
set :deploy_via, :remote_cache
set :branch, "master"
set :ssh_options, { :forward_agent => true }
set :user, "ccastillo"

set :rvm_ruby_string, "1.9.3"
set :rvm_install_pkgs, %w[libyaml openssl]
before 'deploy:setup', 'rvm:install_rvm'   # install RVM
before 'deploy:setup', 'rvm:install_pkgs'  # install RVM packages before Ruby
before 'deploy:setup', 'rvm:install_ruby'  # install Ruby and create gemset, or:
require "rvm/capistrano"


role :web, "cristiancastillo.com"
role :app, "cristiancastillo.com"
role :db,  "cristiancastillo.com", :primary => true
role :db,  "cristiancastillo.com"

