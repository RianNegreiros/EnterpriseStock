Unsplash.configure do |config|
  config.application_access_key = Stripe.api_key = Rails.application.credentials.dig(:unsplash, :access_key)
  config.application_secret = Stripe.api_key = Rails.application.credentials.dig(:unsplash, :secret_key)
  config.application_redirect_uri = Stripe.api_key = Rails.application.credentials.dig(:unsplash, :redirect_url)
  config.utm_source = "lodging-app"
end