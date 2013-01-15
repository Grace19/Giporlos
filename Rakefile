require 'yaml'

config_file = '_config.yml'
config = YAML.load_file(config_file)

env = ENV['env'] || 'production'

#task :deploy do
#  sh "jekyll && rsync -avz --delete #{config['destination']}/ #{config['environments'][env]['remote']['connection']}:#{config['environments'][env]['remote']['path']}"
#end

desc 'deploy'
task :deploy do
  sh 'rsync -rtzh --progress --delete _site/ rebel@rebelcolony.com:~/var/www/apps/'
end

task :launch do
  sh "open #{config['environments'][env]['url']}"
end