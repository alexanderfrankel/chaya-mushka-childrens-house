class Faculty::BaseController < ApplicationController
	before_action :authorize_faculty!

	layout "faculty"

	def index
		@posts = Post.all
	end
end