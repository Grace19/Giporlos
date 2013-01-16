set :application,       'Giporlos'
set :deploy_to,         "/var/www/apps/giporlos"
set :repository,        '_site'
set :scm,               :none
set :deploy_via,        :copy
set :branch,            "master"
set :copy_compression,  :gzip
set :use_sudo,          false
set :host,              '72.14.189.134'


role :web,  host
role :app,  host
role :db,   host, :primary => true
ssh_options[:port] = 8888


ssh_options[:forward_agent] = true

set :user,    'rebel'
set :group,   user

before 'deploy:update', 'deploy:update_jekyll'

namespace :deploy do

  [:start, :stop, :restart, :finalize_update].each do |t|
    desc "#{t} task is a no-op with jekyll"
    task t, :roles => :app do ; end
  end
  
  desc 'Run jekyll to update site before uploading'
    task :update_jekyll do
      %(rm -rf _site/*)
      %(&& jekyll)
    end

end

