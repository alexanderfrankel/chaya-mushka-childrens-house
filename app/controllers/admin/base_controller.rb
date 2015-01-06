class Admin::BaseController < ApplicationController
	before_action :authorize_admin!

	layout "admin"

	def index
		@posts = Post.order(created_at: :desc)
	end
end