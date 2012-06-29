source :rubygems

gem "activerecord", :require => "active_record"
gem "carrierwave", :require => %w(carrierwave carrierwave/orm/activerecord)
gem "erubis"
gem "json"
gem "less"
gem "multi_json"
gem "omniauth-twitter"
gem "pony"
gem "rack"
gem "rack-less"
gem "rake"
gem "ruby-mp3info", :require => "mp3info" # http://ruby-mp3info.rubyforge.org/
gem "sinatra-flash", :require => "sinatra/flash"
gem "therubyracer"
gem "thin"

# Monitoring
group :production do
  gem "newrelic_rpm" # https://newrelic.com/docs/ruby/new-relic-for-ruby
end

# Padrino
gem "padrino", :git => "git://github.com/padrino/padrino-framework.git"

# Database
group :production do
  gem "pg"
end

# Test requirements
gem "rr", :group => "test"
gem "minitest", "~>2.6.0", :require => "minitest/autorun", :group => "test"
gem "rack-test", :require => "rack/test", :group => "test"

# For dev.
group :development, :test do
  gem "heroku"
  gem "shotgun"
  gem "sqlite3"
end
