
module Espial
  module Spec

    class Path < Espial::Spec::Helper
      attr_reader :id
      s_obj_accessor :get, :post

      def initialize(id)
        @id = id
      end

      def operations
        if s_obj.nil?
          raise Espial::SpecError.new('Path operations are invalid')
        else
          s_obj.map {|obj| self.send(obj)}
        end
      end
    end

    class Operation < Espial::Spec::Helper
      attr_accessor :id, :controller_id, :vars
      s_attr_accessor :summary, :description
      a_attr_accessor :tags

      def initialize
        @id             = nil
        @vars           = []
        @controller_id  = nil
      end

      def var(arg)
        @vars.push arg
      end

      def controller(arg)
        @controller_id = arg
      end
    end

    class Get < Operation
      def initialize
        super
        @id = :get
      end
    end

    class Post < Operation
      def initialize
        super
        @id = :post
      end
    end

  end
end
