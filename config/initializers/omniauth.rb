# Configuring providers in the Omniauth and Devise initializers causes an error with authentication. Only configure in a single initializer 
#
# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :twitter, 'CONSUMER_KEY', 'CONSUMER_SECRET'
#   provider :facebook, 'APP_ID', 'APP_SECRET'
#   provider :linked_in, 'CONSUMER_KEY', 'CONSUMER_SECRET'
# end
