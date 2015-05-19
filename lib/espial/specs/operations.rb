
module Espial
  module Spec

    class Operation < Espial::Spec::Helper
      attr_accessor :id, :route_cfg
      s_attr_accessor :summary, :description, :operationId
      b_attr_accessor :deprecated
      a_attr_accessor :tags, :consumes, :produces, :schemes
      a_obj_accessor :parameter
      hid_obj_accessor :response
      h_obj_accessor :security

      # externalDocs, responses, security

      def initialize
        @id        = nil
        @route_cfg = {}
      end

      def route(opts)
        @route_cfg = opts
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
