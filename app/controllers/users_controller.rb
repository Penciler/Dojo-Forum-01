class UsersController < ApplicationController
	before_action :authenticate_user!

	def show
		@user=User.find(params[:id])
		@posts=@user.posts
		@replies=@user.replies
	end
end
