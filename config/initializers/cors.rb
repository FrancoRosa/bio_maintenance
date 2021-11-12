Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'localhost:4000', 'bio-peru.web.app', 'soluciones-biomedicas-peruanas.web.app'
    resource '*', headers: :any, methods: %i[get post]
  end
end
