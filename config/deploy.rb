require 'bundler/capistrano'
require 'capistrano/ext/multistage'
require 'capistrano_colors'
require 'rvm/capistrano'

load 'deploy/assets'

set :application, 'startrip'
set :deploy_via, :remote_cache
set :repository, "git@github.com:thepig/#{application}.git"
set :rvm_type, :user
set :scm, :git
set :unicorn_port, 3000
set :use_sudo, false
set :user, 'startrip'

# SSH
default_run_options[:pty] = true

role :web, '49.212.58.231'
role :app, '49.212.58.231'
role :db, '49.212.58.231', primary: true

namespace :deploy do
  task :symlink_contents do
    run "ln -s #{shared_path}/database.yml #{release_path}/config"
  end

  task :start, roles: :app do
    run "cd #{current_path}; bundle exec unicorn_rails -l #{unicorn_port} -E #{rails_env} -D"
  end
  
  task :stop, roles: :app do
    run "kill -KILL -s QUIT `cat #{shared_path}/pids/unicorn.pid`"
  end

  task :restart, roles: :app do
    deploy.stop
    deploy.start
  end
end

before 'deploy:assets:symlink', 'deploy:symlink_contents'

after 'deploy' do
  deploy.migrate
  deploy.cleanup
end
