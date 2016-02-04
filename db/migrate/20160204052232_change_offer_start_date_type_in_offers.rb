class ChangeOfferStartDateTypeInOffers < ActiveRecord::Migration
  def change
	change_column :offers, :offerstartdate, :date
  end

  def self.down
	change_column :offers, :offerstartdate, :string
  end
end
