
require 'json'

module Espial
  module Spec

    class Schema < Espial::Spec::Helper

      def initialize(id=nil)
        @schema = {}
      end

      def udefine(key,*opts, &block)
        if !key.nil?
          key = key.to_s
          if block_given?
            s = Schema.new
            s.instance_eval(&block)
            @schema[key.to_sym] = s.to_json
          else
            @schema[key.to_sym] = opts[0]
          end
        end
      end
      alias method_missing udefine

      def to_json
        super.merge(@schema)
      end

    end

    class Definition < Schema
      attr_reader :id

      def initialize(id)
        super
        @id = id
      end

    end

  end
end
