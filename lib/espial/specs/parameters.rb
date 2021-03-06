
module Espial
  module Spec

    class Parameter < Espial::Spec::Helper
      s_attr_accessor :name, :in, :description, :type, :format, :collectionFormat,
                      :pattern
      b_attr_accessor :required, :uniqueItems
      h_obj_accessor  :schema

      # schema, items, maximum, exclusiveMaximum, minimum, exclusiveMinimum
      # maxLength, minLength, maxItems, minItems, enum, multipleOf

      def location(value)
        self.send('in', value)
      end

      def default(value=nil)
        if value.nil?
          @default
        else
          s_attr.push 'default'.to_sym
          @default = value
        end
      end
    end

  end
end
