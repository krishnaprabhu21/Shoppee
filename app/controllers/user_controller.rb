class UserController < ApplicationController
	
	before_action :must_be_admin, only: [:index, :edit, :destroy]

	def index
		@user = User.all
	end


	def destroy
		@user = User.find(params[:id])
		@user.destroy
		flash[:success] = "User deleted successfully :)!"
		redirect_to products_path
	end


end
