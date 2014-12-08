
module Espial
  class Engine < Rails::Engine

    def self.draw(&block)
      spec = Espial::Spec::Api.new

      spec.path '' do
        get do
          controller 'espialspec#show'
        end
      end

      spec.instance_eval(&block)

      if spec.id.nil?
        raise Espial::Spec::ApiError.new('API specification id is invalid')
      else
        build_routes(spec)
        Espial::Config.instance.specs[spec.id] = spec
      end
    end

    def build_routes(spec)
      self.routes.draw do
        spec.paths.each do |path|
          path.operations.each do |operation|
            route = {path.id => operation.controller_id, via: operation.id}
            if !operation.vars.empty?
              operation.vars.map {|v| route.merge!(v)}
            end
            match route
          end
        end
      end
    end

  end
end
