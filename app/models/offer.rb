class Offer < ActiveRecord::Base

	belongs_to :products

	validates :offername, presence: true
	validates :offerstartdate, presence: true
	validates :offerenddate, presence: true
	validates :offerdescription, presence: true 

	validate :offerstartdate_cannot_be_in_the_past
	validate :offerenddate_cannot_be_in_the_past

	
	#do not allow offerstartdate to be less than current date
	def offerstartdate_cannot_be_in_the_past
		errors.add(:offerstartdate, "Offer Start Date cannot be less than Todays date :( ! ") if offerstartdate < Date.today
	end

	#do not allow offerenddate to be less than current date
	def offerenddate_cannot_be_in_the_past
		errors.add(:offerenddate, "Offer Start Date cannot be less than Todays date :( ! ") if offerenddate < Date.today
	end

	
	#delete offers whose offerenddate are less than current date
	def self.deleteexpiredoffers
		@expiredoffers = Offer.where("offerenddate < ?", Date.today).ids
		Offer.destroy(@expiredoffers)
	end



end
