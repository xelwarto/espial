class EspialspecController < ApplicationController
	def show
		id = request.script_name
		spec = Espial::Config.instance.specs[id]
		api = spec.to_json

		render json: api
	end
end
