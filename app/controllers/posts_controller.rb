class PostsController < ApplicationController
before_action :authenticate_user!, only: [:destroy,:show, :new, :create]	
before_action :authenticate_admin_or_writer, only:[:destroy, :edit, :update]	

	def index
		#@posts=Post.page(params[:page]).per(20)
		sort=params[:sort]
		catagory=params[:catagory]
		@catagories=Catagory.all

		if catagory != nil
			@catagory=Catagory.find(catagory)
			@post=@catagory.posts
		else
			@post=Post.all
		end

		case 
		when sort=='update'
			@posts=@post.order(reply_update_at: :desc).page(params[:page]).per(20)
		when sort=='replies'
			@posts=@post.order(replies_count: :desc).page(params[:page]).per(20)
		when sort=='view'
			@posts=@post.order(viewed_count: :desc).page(params[:page]).per(20)
		else 
			@posts=@post.page(params[:page]).per(20)
		end
	end

	def new
		@post=Post.new
	end

	def create
		@user=current_user
		@post=@user.posts.build(post_params)
		#@post.catagory_id=10
		@post.save!
		redirect_to post_path(@post)
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
		params.require(:post).permit(:catagory_id, :image, :title,:content, :created_at, :updated_at)
	end

end
