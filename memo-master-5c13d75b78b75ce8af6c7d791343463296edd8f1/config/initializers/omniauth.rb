#config/initializers/omniauth.rb
require 'mhealth'

Rails.application.config.middleware.use OmniAuth::Builder do
  # provider 'mhealth', ENV['MHEALTH_ID'], ENV['MHEALTH_SECRET']
end
