class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  def authenticate_admin
    unless current_user.admin?
      flash[:alert] = "Not allow!"
      redirect_to root_path
    end
  end

  def authenticate_admin_or_writer
  	@post=Post.find(params[:id])
    unless current_user.admin? || current_user.id==@post.user_id
      flash[:alert] = "Not allow!"
      redirect_to post_path(@post)
    end
  end

  def authenticate_admin_or_replier
  	@reply=Reply.find(params[:id])
  	@post=Post.find(params[:post_id])
    unless current_user.admin? || current_user.id==@reply.user_id
      flash[:alert] = "Not allow!"
      redirect_to post_path(@post)
    end
  end
end
