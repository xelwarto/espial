
module Espial
  module Spec
    class Api < Espial::Spec::Helper

      s_attr_accessor :swagger, :basePath, :host
      a_attr_accessor :schemes, :consumes, :produces
      h_obj_accessor :info
      a_obj_accessor :tag
      hid_obj_accessor :path, :response, :definition

      def initialize
        swagger '2.0'
        @api_path = '/api'
      end

      def api_path(path=nil)
        @api_path = path || @api_path
      end

      def id
        @basePath
      end

    end
  end
end
