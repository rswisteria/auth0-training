Rails.application.config.middleware.use OmniAuth::Builder do
  Rails.logger.debug("AUTH0_CLIENT_ID: #{ENV['AUTH0_CLIENT_ID']}")
  Rails.logger.debug("AUTH0_CLIENT_SECRET: #{ENV['AUTH0_CLIENT_SECRET']}")
  provider(
      :auth0,
      Rails.application.secrets.auth0_client_id,
      Rails.application.secrets.auth0_client_secret,
      Rails.application.secrets.auth0_domain,
      callback_path: "/auth/auth0/callback",
      authorize_param: {
          scope: 'openid profile',
          audience: "https://#{ENV['AUTH0_DOMAIN']}/userinfo"
      }
  )
end