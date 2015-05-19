
module Espial
	module Spec
		class Security < Espial::Spec::Helper

      def initialize
        @data = []
      end

      def define(name, scopes=[])
        if !name.nil?
          @data.push({ name => scopes })
        end
      end

      def to_json
        @data
      end

		end
	end
end
