# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin Ajax requests.

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    # Allow requests from your live Vercel app and local development environments
    origins 'https://bens-bikes-frontend.vercel.app', 'localhost:3000', 'localhost:4000'

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head],
      credentials: true # This is required if your frontend uses cookies or authorization headers
  end
end