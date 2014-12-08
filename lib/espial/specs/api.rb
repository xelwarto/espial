
module Espial
  module Spec
    class Api < Espial::Spec::Helper

      s_attr_accessor :swagger, :basePath, :host
      a_attr_accessor :schemes, :consumes, :produces
      s_obj_accessor :info
      a_obj_accessor :path

      def initialize
        swagger '2.0'
      end

      def id
        @basePath
      end

    end
  end
end
