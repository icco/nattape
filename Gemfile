source :rubygems

gem "activerecord", :require => "active_record"
gem "erubis"
gem "json"
gem "less"
gem "mp3info"
gem "multi_json"
gem "omniauth-github" # https://github.com/intridea/omniauth-github
gem "pony"
gem "rack"
gem "rack-less"
gem "rake"
gem "sinatra-flash", :require => "sinatra/flash"
gem "therubyracer"
gem "thin"

# Monitoring
group :production do
  gem 'newrelic_rpm'
end

# Padrino
gem "padrino", :git => "git://github.com/padrino/padrino-framework.git"

# Database
group :production do
  gem "pg"
end

# Test requirements
gem 'rr', :group => "test"
gem 'minitest', "~>2.6.0", :require => "minitest/autorun", :group => "test"
gem 'rack-test', :require => "rack/test", :group => "test"

# For dev.
group :development, :test do
  gem "heroku"
  gem "shotgun"
  gem "sqlite3"
end

