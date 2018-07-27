class PostsController < ApplicationController
before_action :authenticate_user!, only: [:destroy,:show]	
before_action :authenticate_admin, :only =>:destroy	

	def index
		@posts=Post.page(params[:page]).per(20)
	end

	def show
		@post=Post.find(params[:id])
		@user=User.find(@post.user_id)
		@replies=@post.replies
	end

	def destroy
		@post=Post.find(params[:id])
		@post.destroy!
		redirect_to root_path
	end

end
