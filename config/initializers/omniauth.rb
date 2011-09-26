Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'CONSUMER_KEY', 'CONSUMER_SECRET'
  provider :facebook, '	165911090161688', 'cea6374206aa546773c02d53b3e9273e'
end
