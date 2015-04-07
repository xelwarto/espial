
module Espial
  class Engine < Rails::Engine

    def self.draw(&block)
      spec = Espial::Spec::Api.new
      spec.instance_eval(&block)

      if spec.id.nil?
        raise Espial::Spec::ApiError.new('API specification id is invalid')
      else
        spec.path spec.api_path do
          get do
            route controller: 'espialspec#show'
            tags ['api-spec']
            description 'Retreive the API specification'
            produces [ 'application/json' ]
          end
        end

        Espial::Config.instance.specs[spec.id] = spec
        build_routes(spec)
      end
    end

    def build_routes(spec)
      self.routes.draw do
        spec.paths.each do |path|
          route_path = path.id.gsub(/\{([^\/]*)?\}/,':\1')
          path.operations.each do |operation|
            r_cfg = operation.route_cfg
            controller = r_cfg.delete(:controller)
            route = {route_path => controller, via: operation.id}
            route.merge!(r_cfg)
            match route
          end
        end
      end
    end

  end
end
