class NatTape < Padrino::Application

  def self.version
    "0.0.1"
  end

  # Enables .less in app/stylesheets/
  register LessInitializer

  # Enables render()
  register Padrino::Rendering

  # For mailing...?
  register Padrino::Mailer

  # Lots of small useful functions.
  register Padrino::Helpers

  register Padrino::Cache # includes helpers
  enable :caching         # turns on caching

  # Because we need to make sure ActiveRecord cleans up after itself.
  use ActiveRecord::ConnectionAdapters::ConnectionManagement

  use Rack::Session::Cookie
  use OmniAuth::Builder do
    provider :developer if PADRINO_ENV == "development"
    provider :twitter,  ENV['TWITTER_KEY'],  ENV['TWITTER_SECRET']
  end

  use Rack::Lint
end
