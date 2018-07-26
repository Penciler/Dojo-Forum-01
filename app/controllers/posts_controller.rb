class PostsController < ApplicationController
before_action :authenticate_user!, :only =>:destroy	
before_action :authenticate_admin, :only =>:destroy	

	def index
		@posts=Post.all
	end

	def destroy
		@post=Post.find(params[:id])
		@post.destroy!
		redirect_to root_path
	end

end
