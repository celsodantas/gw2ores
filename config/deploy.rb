require "bundler/capistrano"
require "rvm/capistrano"

load 'deploy/assets'

set :rvm_ruby_string, '1.9.3'
set :rvm_type, :user  # Don't use system-wide RVM

server "162.243.12.152", :web, :app, :db, primary: true

set :application, "gw2ores"

set :scm, "git"
set :repository,  "https://github.com/celsodantas/gw2ores.git"
set :branch, "master"

set :user, "deployer"
# set :server_ip, "162.243.12.152"
set :deploy_to, "/home/#{user}/rails_apps/#{application}"
set :use_sudo, false

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

# role :web, server_ip                          # Your HTTP server, Apache/etc
# role :app, server_ip                          # This may be the same as your `Web` server
# role :db,  server_ip, :primary => true # This is where Rails migrations will run

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

after "deploy", "deploy:cleanup" # keep only the last 5 releases

namespace :deploy do
  %w[start stop restart].each do |command|
    desc "#{command} unicorn server"
    task command, roles: :app, except: {no_release: true} do
      run "/etc/init.d/unicorn_#{application} #{command}"
    end
  end

  task :setup_config, roles: :app do
    sudo "ln -nfs #{current_path}/config/nginx.conf /etc/nginx/sites-enabled/#{application}"
    sudo "ln -nfs #{current_path}/config/unicorn_init.sh /etc/init.d/unicorn_#{application}"
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
end

before "deploy:restart" do
	# copying newrelic config file
	# run "cp ~/private_folder/newrelic.yml #{current_path}/config"
	# run "cp ~/private_folder/reset_key.rb #{current_path}/config/initializers"
end


        # require './config/boot'
        # require 'airbrake/capistrano'
