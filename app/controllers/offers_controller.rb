class OffersController < ApplicationController

	before_action :must_be_admin, only: [:index, :new, :create, :edit, :update, :destroy] 

	def index
		@offers = Offer.all
		@products = Product.all
		
		#delete offers whose offerend date less than today
		Offer.deleteexpiredoffers
	end

	def show
	end
		
	def new 
		@offer = Offer.new
	end

	def create
	  	@offer = Offer.create(offer_params)

		if @offer.save
			flash[:notice] = 'Offer created'
			redirect_to @offer
		else
			flash[:notice] = 'Error, Please create offer again!'
			render 'new'
		end
	end

	def edit
		@offer = Offer.find(params[:id])
	end

	def update 
		@offer = Offer.find(params[:id])

		if @offer.update_attributes(offer_params)
			flash[:success] = "Offer updated :)!"
		        redirect_to @offer

		else
			render 'edit'
		end
	end

	def destroy
		@offer = Offer.find(params[:id])
		@offer.destroy
		flash[:success] = "Offer deleted successfully :)!"
		redirect_to offers_path
	end

	
	private
	
		def offer_params
			params.require(:offer).permit(:offername, :product_id, :offerstartdate, :offerenddate, :offerdescription)
		end



end
