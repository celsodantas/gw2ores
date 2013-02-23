require "bundler/capistrano"
require "rvm/capistrano"

load 'deploy/assets'

#set :rvm_ruby_string, '1.9.3'
#set :rvm_type, :user  # Don't use system-wide RVM

set :application, "gw2ores"
set :repository,  "https://github.com/celsodantas/gw2ores.git"
set :user, ENV['GW2ORES_USER']
set :server_ip, "198.211.97.163"
set :deploy_to, "/home/#{user}/rails_apps/#{application}"

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, server_ip                          # Your HTTP server, Apache/etc
role :app, server_ip                          # This may be the same as your `Web` server
role :db,  server_ip, :primary => true # This is where Rails migrations will run

default_run_options[:pty] = true

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

end

# namespace :assets do
#   task :precompile, :roles => :web, :except => { :no_release => true } do
#     run "cd #{current_path} && #{rake} assets:precompile --trace"
#   end
# end

#after "deploy:create_symlink", "assets:precompile"
after :deploy, "deploy:migrate"

