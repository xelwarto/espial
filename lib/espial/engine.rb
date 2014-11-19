
module Espial
	class Engine < Rails::Engine

		def self.draw(&block)
			spec = Espial::ApiSpec.new
      spec.instance_eval(&block)

      if spec.id.nil?
        raise Espial::ApiSpecError.new('API specification id is invalid')
      else
        build_routes(spec)
        Espial::Config.instance.specs[spec.id] = spec
      end
		end

		def build_routes(spec)
			self.routes.draw do
        spec.paths.each do |path|
          path.methods.each do |method|
            route = {path.name => method.c, via: method.operation}
            if !method.vars.empty?
              method.vars.map {|v| route.merge!(v)}
            end
            match route
          end
        end
      end
		end

	end
end
