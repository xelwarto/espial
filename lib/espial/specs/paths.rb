
module Espial
  module Spec

    class Path < Espial::Spec::Helper
      attr_reader :id
      s_obj_accessor :get, :put, :post, :delete, :options, :head, :patch
      a_obj_accessor :parameter

      def initialize(id)
        @id = id
      end

      def operations
        if s_obj.nil?
          raise Espial::Spec::Error.new('Path operations are invalid')
        else
          s_obj.map {|obj| self.send(obj)}
        end
      end
    end

    class Operation < Espial::Spec::Helper
      attr_accessor :id, :controller_id, :vars
      s_attr_accessor :summary, :description, :operationId
      a_attr_accessor :tags, :consumes, :produces, :schemes
      a_obj_accessor :parameter

      # externalDocs, responses, deprecated, security

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

    class Put < Operation
      def initialize
        super
        @id = :put
      end
    end

    class Post < Operation
      def initialize
        super
        @id = :post
      end
    end

    class Delete < Operation
      def initialize
        super
        @id = :delete
      end
    end

    class Options < Operation
      def initialize
        super
        @id = :options
      end
    end

    class Head < Operation
      def initialize
        super
        @id = :head
      end
    end

    class Patch < Operation
      def initialize
        super
        @id = :patch
      end
    end

  end
end
