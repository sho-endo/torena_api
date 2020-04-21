if Rails.env == 'production'
  Rails.application.config.session_store :cookie_store, key: '_torena_api_key', domain: 'torena-api.herokuapp.com'
else
  Rails.application.config.session_store :cookie_store, key: '_torena_api_key'
end
