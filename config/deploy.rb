set :application,       'Giporlos'
set :deploy_to,         "/var/www/apps"
set :repository,        'git@github.com:Grace19/Giporlos.git'
set :scm,               :git
set :deploy_via,        :copy
set :branch,            "master"
set :copy_compression,  :gzip
set :use_sudo,          true
set :host,              'http://www.itcservices.co'


role :web,  host
role :app,  host
role :db,   host, :primary => true
ssh_options[:port] = 8888


ssh_options[:forward_agent] = true

set :user,    'rebel'

before 'deploy:update', 'deploy:update_jekyll'

namespace :deploy do

  [:start, :stop, :restart, :finalize_update].each do |t|
    desc "#{t} task is a no-op with jekyll"
    task t, :roles => :app do ; end
  end
  
  desc 'Run jekyll to update site before uploading'
    task :update_jekyll do
      %x(rm -rf _site/* && jekyll)
    end

end

