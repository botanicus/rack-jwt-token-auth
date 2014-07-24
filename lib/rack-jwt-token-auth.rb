require 'jwt'

module Rack
  class JWTAuthMiddleware
    def initialize(app, &decoder)
      @app, @decoder = app, decoder
    end

    def call(env)
      begin
        if env['HTTP_AUTHORIZATION']
          token = env['HTTP_AUTHORIZATION'].match(/JWT token="(.+)"/)[1]
          env['user'] = @decoder.call(token)
        end
      rescue JWT::DecodeError => error
        body = {message: error.message}.to_json

        headers = {
          'Content-Type' => 'application/json',
          'Content-Length' => body.bytesize.to_s
        }

        return [401, headers, [body]]
      end

      @app.call(env)
    end
  end
end
