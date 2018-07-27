class PostsController < ApplicationController
before_action :authenticate_user!, only: [:destroy,:show]	
before_action :authenticate_admin_or_writer, only:[:destroy, :edit, :update]	

	def index
		@posts=Post.page(params[:page]).per(20)
	end

	def show
		@post=Post.find(params[:id])
		@post.viewed_count+=1
		@post.save
		@user=User.find(@post.user_id)
		@replies=@post.replies.page(params[:page]).per(20)
		@reply=Reply.new
	end

	def edit
		@post=Post.find(params[:id])
	end

	def update
		@post=Post.find(params[:id])
		@post.update(post_params)
		redirect_to post_path(@post)
	end

	def destroy
		@post=Post.find(params[:id])
		@post.destroy!
		redirect_to root_path
	end

private

	def post_params
		params.require(:post).permit( :title,:content, :created_at, :updated_at)
	end

end
