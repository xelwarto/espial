
require 'json'
require 'espial/controller/helper'

class EspialSpecController < ApplicationController
	include Espial::Controller::Helper

	def show
		spec = espial_get_spec.to_hash rescue nil

		if spec.nil?
			spec = { error: 'Unable to generate API specification' } rescue nil
		else
			if params.include? :pretty
				spec = JSON.pretty_unparse(spec) rescue nil
			end
		end

		response.headers['Access-Control-Allow-Origin'] = '*'
		response.headers['Vary'] = %w(Accept-Encoding Origin)
		render json: spec
	end

	def cors
		response.headers['Access-Control-Allow-Origin'] = '*'
		response.headers['Vary'] = %w(Accept-Encoding Origin)
		response.headers['Access-Control-Allow-Methods'] = 'GET'
		render nothing: true
	end

end
