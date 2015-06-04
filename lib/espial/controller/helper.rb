
require 'espial'
require 'json-schema'

module Espial
  module Controller
    module Helper

      def espial_get_id
        request.script_name
      end

      def espial_get_spec
    		Espial::Config.instance.specs[espial_get_id]
      end

      def espial_validate_json(fragment, json)
        return JSON::Validator.fully_validate(espial_get_spec.to_hash, json, validate_schema: true, fragment: fragment)
      end

    end
  end
end
