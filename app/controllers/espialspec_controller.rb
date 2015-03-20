
class EspialspecController < ApplicationController
	def show
		id = request.script_name
		spec = Espial::Config.instance.specs[id]
		api = spec.to_json

		if params.include? :pretty
			api = JSON.pretty_unparse(api)
		end

		render json: api
	end
end
