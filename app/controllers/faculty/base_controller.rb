class Faculty::BaseController < ApplicationController
	before_action :authorize_faculty!

	def index
	end
end