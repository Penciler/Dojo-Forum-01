class RepliesController < ApplicationController
before_action :authenticate_user!	
before_action :authenticate_admin_or_replier, only:[:destroy, :edit, :update]

	def create
		@post= Post.find(params[:post_id])
		@reply= @post.replies.build(reply_params)
		@reply.user=current_user
		@reply.save!
		redirect_to post_path(@post)
	end

	def edit
		@reply=Reply.find(params[:id])
	end

	def update
		@reply=Reply.find(params[:id])
		@post= Post.find(params[:post_id])
		@reply.update(reply_params)
		redirect_to post_path(@post)
	end

	def destroy
		@reply=Reply.find(params[:id])
		@post= Post.find(params[:post_id])
		@reply.destroy!
		redirect_to post_path(@post)
	end

private 

    def reply_params
    	params.require(:reply).permit( :content, :created_at, :updated_at)
    end
end
