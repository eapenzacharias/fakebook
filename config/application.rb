require_relative 'boot'
require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Fakebook
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.secret_key_base = '077c995040d2d610fe9aa85e8b88db6372fc5164f7f1814948e8c836dba4cece3567172a6b61d25926e5d996bdd52cdaf4708f1ba6433be16f3cc31b9f2b6474'
    
    # Load ENV variables from credentials.yml file
    config.before_configuration do
      env_file = File.join(Rails.root, 'config', 'credentials.yml')
      YAML.load(File.open(env_file))[Rails.env].each do |key, value|
        ENV[key.to_s] = value
      end if File.exists?(env_file)
    end
    # config.factory_bot.definition_file_paths = ["spec/factories"]
    config.assets.paths << "#{Rails}/vendor/assets/fonts"

    config.generators do |g|
      g.test_framework :rspec,
      fixtures: false,
      view_specs: false,
      helper_specs: false,
      routing_specs: false
    end
  end
end
