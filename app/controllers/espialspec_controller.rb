
class EspialspecController < ApplicationController
	def show
		id = request.script_name
		spec = Espial::Config.instance.specs[id]
		api = spec.to_json

		if params.include? :pretty
			api = JSON.pretty_unparse(api)
		end

		response.headers['Access-Control-Allow-Origin'] = '*'
		response.headers['Vary'] = %w(Accept-Encoding Origin)
		render json: api
	end
end
