class Faculty::PostsController < Faculty::BaseController
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
			redirect_to faculty_post_path(@post)
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
			redirect_to faculty_post_path(@post)
		else
			flash[:alert] = "Post has not been updated."
			render "edit"
		end
	end

	def destroy
		@post.destroy

		flash[:notice] = "Post has been deleted."
		redirect_to faculty_root_path
	end

	private

	def post_params
		params.require(:post).permit(:title, :content)
	end

	def set_post
		@post = Post.find(params[:id])
	rescue ActiveRecord::RecordNotFound
		flash[:alert] = "The post you were looking for could not be found."
		redirect_to faculty_posts_path
	end
end