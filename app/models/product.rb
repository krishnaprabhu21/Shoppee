class Product < ActiveRecord::Base

	has_many :offers, :dependent => :destroy

	validates :name, presence: true
	validates :description, presence: true
	validates :image, presence: true
	validates :rate, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
	

	#paperclip
	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/




end
