
require "espial/specs"

module Espial
  class ApiSpec
    attr_reader :id, :paths

    def initialize
      @swagger    = '2.0'
      @id         = nil
      @basePath   = nil
      @paths      = Espial::Spec::Paths.new

			path '' do
				get do
					controller 'espialspec#show'
				end
			end
    end

    def basePath(arg)
      @basePath = arg
      @id = arg
    end

    def path(name,&block)
      path = Espial::Spec::Path.new(name)
      path.instance_eval(&block)
      @paths.push path
    end

  end
end
