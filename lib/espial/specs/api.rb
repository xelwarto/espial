
module Espial
  module Spec
    class Api < Espial::Spec::Helper
      attr_reader :spec_path

      s_attr_accessor :swagger, :basePath, :host
      a_attr_accessor :schemes, :consumes, :produces
      h_obj_accessor :info
      a_obj_accessor :tag
      hid_obj_accessor :path, :response, :definition

      def initialize
        swagger '2.0'
        @spec_path = nil
      end

      def specPath(path=nil)
        @spec_path = path
      end

      def id
        @basePath
      end

    end
  end
end
