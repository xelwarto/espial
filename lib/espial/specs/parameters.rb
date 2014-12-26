
module Espial
  module Spec

    class Parameter < Espial::Spec::Helper
      s_attr_accessor :name, :in, :description, :type, :format, :collectionFormat,
                      :pattern
      b_attr_accessor :required, :uniqueItems

      # schema, items, default, maximum, exclusiveMaximum, minimum, exclusiveMinimum
      # maxLength, minLength, maxItems, minItems, enum, multipleOf

      def location(value)
        self.send('in', value)
      end
    end

  end
end
