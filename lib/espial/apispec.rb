
module Espial
	class ApiSpec
		attr_reader :id, :paths

		def initialize
			@swagger 		= '2.0'
			@id 				= nil
			@basePath 	= nil
			@paths 			= []
		end

		def basePath(arg)
      @basePath = arg
      @id = arg
    end
	end
end
