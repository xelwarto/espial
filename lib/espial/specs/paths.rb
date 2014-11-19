
module Espial
  module Spec

    class Paths < Array
      def to_h
        p = {}
        self.each do |path|
          p[path.name] = path.to_h
        end
        p
      end
    end

    class Path
      attr_reader :id, :methods

      def initialize(id)
        @id				= id
        @methods	= []
      end

      def get(&block)
        new_method(:get,&block)
      end

      def post(&block)
        new_method(:post,&block)
      end

      def new_method(name,&block)
        method = Method.new(name.to_sym)
        method.instance_eval(&block)
        @methods.push method
      end

      def to_h
        p = {}
        @methods.each do |method|
          p[method.id] = method.to_h
        end
        p
      end

    end

    class Method
      attr_accessor :id, :controller_id, :vars, :summary

      def initialize(id)
        @controller_id 	= nil
        @id 						= id
        @vars 					= []
        @summary 				= nil
      end

      def to_h
        {
          summary: @summary
        }
      end

      def var(arg)
        @vars.push arg
      end

      def summary(arg)
        @summary = arg
      end

      def controller(arg)
        @controller_id = arg
      end

    end

  end
end
