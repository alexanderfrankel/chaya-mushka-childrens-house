class Admin::PostsController < Admin::BaseController
	before_action :set_post, only: [:show, :edit, :update, :destroy]

	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.user = current_user

		if @post.save
			flash[:notice] = "Post has been created."
			redirect_to admin_post_path(@post)
		else
			flash[:alert] = "Post has not been created."
			render "new"
		end
	end

	def show
	end

	def edit
	end

	def update
		if @post.update(post_params)
			flash[:notice] = "Post has been updated."
			redirect_to admin_post_path(@post)
		else
			flash[:alert] = "Post has not been updated."
			render "edit"
		end
	end

	def destroy
		@post.destroy

		flash[:notice] = "Post has been deleted."
		redirect_to admin_posts_path
	end

	private

	def post_params
		params.require(:post).permit(:title, :content)
	end

	def set_post
		@post = Post.find(params[:id])
	rescue ActiveRecord::RecordNotFound
		flash[:alert] = "The post you were looking for could not be found."
		redirect_to admin_posts_path
	end
end