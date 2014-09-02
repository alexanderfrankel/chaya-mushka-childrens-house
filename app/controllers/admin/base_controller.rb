class Admin::BaseController < ApplicationController
	before_action :authorize_admin!

	def index
		@posts = Post.all
	end
end