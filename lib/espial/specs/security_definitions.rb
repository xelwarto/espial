
module Espial
  module Spec

    class Securitydefinition < Espial::Spec::Helper
      attr_reader :id
      s_attr_accessor :type, :description, :name, :flow, :authorizationUrl, :tokenUrl, :in
      h_obj_accessor :scopes

      def initialize(id)
        @id = id
      end

      def location(value)
        self.send('in', value)
      end

    end

  end
end
