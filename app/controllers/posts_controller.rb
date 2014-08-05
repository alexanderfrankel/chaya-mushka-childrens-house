class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)

		if @post.save
			flash[:notice] = "Post has been created."
			redirect_to @post
		else
			flash[:alert] = "Post has not been created."
			render "new"
		end
	end

	def show
		@post = Post.find(params[:id])
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		if @post.update(post_params)
			flash[:notice] = "Post has been updated."
			redirect_to @post
		else
			flash[:alert] = "Post has not been updated."
			render "edit"
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy

		flash[:notice] = "Post has been deleted."
		redirect_to posts_path
	end

	private

	def post_params
		params.require(:post).permit(:title, :content)
	end

end