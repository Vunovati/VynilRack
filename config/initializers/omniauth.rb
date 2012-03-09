Rails.application.config.middleware.use OmniAuth::Builder do
	provider :twitter, 'EWvKWK2UfcDhfxJCQR3cg', 'WBVkMjwPd9UcYcP0YreQdzFqzo5mpWEsQs1TzgLO38'
	provider :identity, on_failed_registration: lambda { |env|
		IdentitiesController.action(:new).call(env)
	}
end