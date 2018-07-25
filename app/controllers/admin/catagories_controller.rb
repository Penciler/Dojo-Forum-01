class Admin::CatagoriesController < ApplicationController
	before_action :authenticate_user!
	before_action :authenticate_admin

	def index
		@catagories=Catagory.all
		@catagory=Catagory.new
	end

	def create
		@catagory=Catagory.create(catagory_params)

	    if @catagory.save
	      flash[:notice] = "catagory was successfully created"
	    else
	      flash[:alert] = "catagory was failed to create"
	    end
	    redirect_back(fallback_location: admin_catagories_path)

	end

	def edit
		@catagory = Catagory.find(params[:id])
	end

	def update
		@catagory = Catagory.find(params[:id])
		@catagory.update(catagory_params)
		redirect_to admin_catagories_path
	end

	def destroy
		@catagory = Catagory.find(params[:id])
		@catagory.destroy!
		redirect_to admin_catagories_path
	end

private
    def catagory_params
      params.require(:catagory).permit( :name, :created_at, :updated_at)
    end
end
