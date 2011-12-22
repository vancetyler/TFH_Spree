$:.unshift(File.expand_path('./lib', ENV['rvm_path']))
require "rvm/capistrano"
require "bundler/capistrano"

set :application, "store"
set :user, 'spree'
set :group, 'www-data'
set :domain, "tfh.spreeworks.com"

set :rvm_ruby_string, 'ree-1.8.7-2011.03'

set :scm, :git

role :web, '50.57.154.26'
role :app, '50.57.154.26'
role :db,  '50.57.154.26', :primary => true

set :repository,  "git://github.com/vancetyler/TFH_Spree.git"
set :branch,      "master"
set :deploy_to,   "/data/#{application}"
set :deploy_via,  :remote_cache
set :use_sudo,    false

default_run_options[:pty] = true
set :ssh_options, { :forward_agent => true }

namespace :foreman do
  desc "Export the Procfile to Ubuntu's upstart scripts"
  task :export, :roles => :app do
    run "cd #{current_path} && bundle exec foreman export upstart /etc/init -a #{application}  -u spree"
  end

  desc "Start the application services"
  task :start, :roles => :app do
    sudo "start #{application}"
  end

  desc "Stop the application services"
  task :stop, :roles => :app do
    sudo "stop #{application}"
  end

  desc "Restart the application services"
  task :restart, :roles => :app do
    sudo "restart #{application}"
  end
end

namespace :deploy do
  desc "Symlink shared configs and folders on each release."
  task :symlink_shared do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    run "ln -nfs #{shared_path}/config/Procfile #{release_path}/Procfile"
  end
end

before 'deploy:start', 'foreman:export'
after 'deploy:start', 'foreman:start'

before 'deploy:restart', 'foreman:export'
after 'deploy:restart', 'foreman:restart'

load 'deploy/assets'
before 'deploy:assets:precompile', 'deploy:symlink_shared'