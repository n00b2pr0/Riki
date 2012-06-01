Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, GOOGLE_KEY, GOOGLE_SECRET
  provider :identity, on_failed_registration: lambda { |env|
  	IdentitiesController.action(:new).call(env)
  }
end