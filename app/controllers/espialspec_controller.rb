class EspialspecController < ApplicationController
	def show
		id = request.script_name
		spec = Espial::Config.instance.specs[id]
		api = spec.to_json

		if !params[:fmt].nil?
			api = JSON.pretty_unparse(api)
		end

		render json: api
	end
end
