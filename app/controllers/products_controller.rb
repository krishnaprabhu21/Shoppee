class ProductsController < ApplicationController

	before_action :must_be_admin, only: [:index, :new, :create, :edit, :update, :destroy]

	def index
		@users = User.where(admin: false)
		@products = Product.all
		@offers = Offer.all
	
	end


	def show
		
	end
		
	def new 
		@product = Product.new
	end

	def create
	  	@product = Product.create(product_params)

		if @product.save
			flash[:notice] = 'Product created'
			redirect_to @product
		else
			flash[:notice] = 'Error, Please create Product again!'
			render 'new'
		end
	end

	def edit
		@product = Product.find(params[:id])
	end

	def update 
		@product = Product.find(params[:id])

		if @product.update_attributes(product_params)
			flash[:success] = "Product updated :)!"
		        redirect_to @product

		else
			render 'edit'
		end
	end

	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		flash[:success] = "Product deleted successfully :)!"
		redirect_to products_path
	end

	
	private
	
		def product_params
			params.require(:product).permit(:name, :description, :image, :rate)
		end
		

end
