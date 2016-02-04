class WelcomeController < ApplicationController

	def index
		
		if current_user.try(:admin?)
			flash[:notice] = 'Admin'
		end
	end

	def index 
		get_products
	end

	private
		def get_products
			@products = Product.all
		end	
end
