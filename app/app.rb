class NatTape < Padrino::Application

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
    provider :github,   ENV['GITHUB_KEY'],   ENV['GITHUB_SECRET'], scope: "user,gist"
  end

  use Rack::Lint
end
