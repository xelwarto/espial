
require 'espial'

module Espial
  module Controller
    module Helper

      def get_spec
        id = request.script_name
    		Espial::Config.instance.specs[id]
      end

    end
  end
end
