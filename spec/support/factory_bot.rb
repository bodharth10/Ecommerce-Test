require 'factory_bot'

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
    config.include Devise::Test::ControllerHelpers, :type => :controller
  config.include Warden::Test::Helpers
end
