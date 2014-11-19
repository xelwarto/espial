
module Espial
	class ApiSpec
		attr_reader :id

		def initialize
			@swagger = '2.0'
			@id = nil
		end
	end
end
