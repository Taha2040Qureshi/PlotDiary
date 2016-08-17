require 'mina/multistage'
require 'mina/bundler'
require 'mina/rails'
require 'mina/git'

set :shared_paths, ['config/application.yml','config/database.yml', 'log','public/uploads']


task :environment do
  # If you're using rbenv, use this to load the rbenv environment.
  # Be sure to commit your .rbenv-version to your repository.
  # invoke :'rbenv:load'

  # For those using RVM, use this to load an RVM version@gemset.
  # invoke :'rvm:use[ruby-1.9.3-p125@default]'
end

task :setup => :environment do
  queue! %[mkdir -p "#{deploy_to}/shared/log"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/log"]

  queue! %[mkdir -p "#{deploy_to}/shared/public/uploads"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/public/uploads"]

  queue! %[mkdir -p "#{deploy_to}/shared/config"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/config"]

  queue! %[touch "#{deploy_to}/shared/config/database.yml"]
  queue  %[echo "-----> Be sure to edit '#{deploy_to}/shared/config/database.yml'."]

  queue! %[touch "#{deploy_to}/shared/config/secrets.yml"]
  queue  %[echo "-----> Be sure to edit '#{deploy_to}/shared/config/secrets.yml'."]

  queue! %[touch "#{deploy_to}/shared/config/application.yml"]
  queue  %[echo "-----> Be sure to edit '#{deploy_to}/shared/config/application.yml'."]
end


desc "Deploys the current version to the server."
task :deploy => :environment do
  deploy do
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'rails:db_migrate'
    invoke :'rails:assets_precompile'
    to :launch do
      queue "mkdir -p #{deploy_to}/#{current_path}/tmp/"
      queue "touch #{deploy_to}/#{current_path}/tmp/restart.txt"

    end
  end
end



### Connect Rails Console###########
desc 'RUN Console Locally'
task 'rails:console' => :environment do
  queue! "cd #{deploy_to}/#{current_path} ; RAILS_ENV=production rails c"
end





##### Get all Releases ####
desc 'Get list of all releases'
task 'app:releases' => :environment do
  queue! "cd #{deploy_to}/#{releases_path} ; ls"
end


###### INSTALL RUBY #################

# desc 'INSTALL RUBY with RVM'
# task 'ruby:install' => :environment do
#   invoke 'rbenv:prepare'
#   queue 'rvm install 1.9.3-p327'
#   queue 'rvm local 1.9.3-p327'
#   queue 'gem install bundler'
# end

######APACHE ONLY ###############

desc "Create Apache site file"
task :'setup:apache' => :environment do
  # Get variable for virtual host configuration file
  fqdn = get_fqdn()
  fqdn_ext = external_fqdn()
  # Virtual Host configuration file
  vhost = <<-HOSTFILE.dedent
    <VirtualHost *:80>
      ServerAdmin rehanir.munir@gmail.com
      ServerName www.tahirbusinessonline.tk
      ServerAlias town.tahirbusinessonline.tk
      DocumentRoot #{deploy_to!}/#{current_path!}/public
      RailsEnv production
      <Directory #{deploy_to!}/#{current_path!}/public>
        Options -MultiViews
        AllowOverride all
      </Directory>
      PassengerMinInstances 5
      # Maintenance page
      ErrorDocument 503 /503.html
      RewriteEngine On
      RewriteCond %{REQUEST_URI} !.(css|gif|jpg|png)$
      RewriteCond %{DOCUMENT_ROOT}/503.html -f
      RewriteCond %{SCRIPT_FILENAME} !503.html
      RewriteRule ^.*$ - [redirect=503,last]
    </VirtualHost>
  HOSTFILE
  queue! %{
    echo "-----> Create Temporary Apache Virtual Host"
    echo "#{vhost}" > #{fqdn}.tmp
    echo "-----> Copy Virtual Host file to /etc/apache2/sites-available/ (requires sudo)"
    #{echo_cmd %[sudo cp #{fqdn}.tmp /etc/apache2/sites-available/#{fqdn}]}
    echo "-----> Remove Temporary Apache Virtual Host"
    rm #{fqdn}.tmp
    echo "-----> Done"
  }
end

# Enable the new Virtual Host and restart Apache
desc "Enable new Apache host file"
task :'apache:enable' => :environment do
  fqdn = get_fqdn()
  queue! %{
    echo "-----> Enable Apache Virtual Host"
    #{echo_cmd %[sudo a2ensite #{fqdn}]}
    echo "-----> Remove Temporary Apache Virtual Host"
    #{echo_cmd %[sudo service apache2 reload]}
         }
end

def get_fqdn()
  fqdn =  "town.tahirbusinessonline.tk.conf" #name of site
  return fqdn
end

class String
  def dedent
    lines = split "\n"
    return self if lines.empty?
    indents = lines.map do |line|
      line =~ /\S/ ? (line.start_with?(" ") ? line.match(/^ +/).offset(0)[1] : 0) : nil
    end
    min_indent = indents.compact.min
    return self if min_indent.zero?
    lines.map { |line| line =~ /\S/ ? line.gsub(/^ {#{min_indent}}/, "") : line }.join "\n"
  end
end