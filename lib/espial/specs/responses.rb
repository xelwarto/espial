
module Espial
  module Spec

    class Response < Espial::Spec::Helper
      attr_reader :id
      s_attr_accessor :description
      h_obj_accessor :schema

      # headers, examples

      def initialize(id)
        @id = id
      end
    end

  end
end
