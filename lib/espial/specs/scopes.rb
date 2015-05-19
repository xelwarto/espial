
module Espial
	module Spec

		class Scopes < Espial::Spec::Helper

      def initialize
        @scopes = {}
      end

      def scope(name, descr='')
        if !name.nil?
          @scopes[name] = descr
        end
      end

      def to_json
        @scopes
      end

		end

	end
end
