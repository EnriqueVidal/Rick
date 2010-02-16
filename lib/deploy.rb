set :use_sudo,        false
set :group_writable,  false

set :keep_releases,   2

set :application,     "rick"
set :domain,          "bot.cloverinteractive.com"
set :user,            "cloverin"

set :scm, :git
set :repository,      "ssh://thinktan@thinktankhost.com/~/git/rick.git"
set :branch,          "master"

set :deploy_to,       "/home/#{user}/etc/sinatra_apps/rick"

role :app,            domain
role :web,            domain


namespace :deploy do
  desc <<-DESC
    Deploys and starts a `cold' application. This is useful if you have not \
    deployed your application before, or if your application is (for some \
    other reason) not currently running. It will deploy the code, run any \
    pending migrations, and then instead of invoking `deploy:restart', it will \
    invoke `deploy:start' to fire up the application servers.
  DESC

  task :cold do
    update
    site5::create_log_folder
    site5::link_public_html
    site5::restart_txt
  end
 
  desc "Restart Passenger app"
  task :restart do
    site5::restart_txt
  end
 
  namespace :site5 do
    
    desc "Links public_html to current_release/public"
    task :link_public_html do
      #run "cd /home/#{user}; rm -fr public_html; ln -s #{current_path}/public /home/#{user}/public_html"
      run "cd /home/#{user}/public_html; rm bot; ln -s #{current_path}/public /home/#{user}/public_html/bot"
    end
 
    desc "Create log folder in shared"
    task :create_log_folder do
      run "cd #{deploy_to}; mkdir -p shared/log"
    end
 
    desc "Touches tmp/restart.txt"
    task :restart_txt do
      run "touch #{current_path}/tmp/restart.txt"
    end
  end
end