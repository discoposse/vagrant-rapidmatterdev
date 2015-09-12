sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get update && sudo apt-get install -y vim git puppet nodejs

# Install pre-req stuff for Ruby environment
sudo apt-get install -y git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev

# Get some rbenv goodness
git clone git://github.com/sstephenson/rbenv.git .rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL

git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL

git clone https://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash

# Install ruby using rbenv
rbenv install 2.2.0
rbenv global 2.2.0

# Make sure that we exclude docs from gem installs to save time/space
echo "gem: --no-ri --no-rdoc" > ~/.gemrc

# Install bundler
gem install bundler

# Install Nginx

# Install Phusion's PGP key to verify packages
gpg --keyserver keyserver.ubuntu.com --recv-keys 561F9B9CAC40B2F7
gpg --armor --export 561F9B9CAC40B2F7 | sudo apt-key add -

# Add HTTPS support to APT
sudo apt-get install apt-transport-https

# Add the passenger repository
sudo sh -c "echo 'deb https://oss-binaries.phusionpassenger.com/apt/passenger trusty main' >> /etc/apt/sources.list.d/passenger.list"
sudo chown root: /etc/apt/sources.list.d/passenger.list
sudo chmod 600 /etc/apt/sources.list.d/passenger.list
sudo apt-get update

# Install nginx and passenger
sudo apt-get install -y nginx-full passenger

sudo cp /vagrant/rapidmatter-passenger /etc/nginx/nginx.conf 

sudo service nginx start

# Install PostgreSQL
sudo apt-get install postgresql postgresql-contrib libpq-dev

sudo su - postgres -c "create role rapidmatter with createdb login password 'rapidmatter';"

# Install rails
gem install rails --no-ri --no-rdoc






