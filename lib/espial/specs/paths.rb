
module Espial
  module Spec

    class Path < Espial::Spec::Helper
      attr_reader :id
      h_obj_accessor :get, :put, :post, :delete, :options, :head, :patch
      a_obj_accessor :parameter

      def initialize(id)
        @id = id
      end

      def operations
        if h_obj.nil?
          raise Espial::Spec::Error.new('Path operations are invalid')
        else
          h_obj.map {|obj| self.send(obj)}
        end
      end
    end
    
  end
end
