class ChangeOfferEndDateTypeInOffers < ActiveRecord::Migration
  def change
	change_column :offers, :offerenddate, :date
  end

  def self.down
	change_column :offers, :offerenddate, :string
  end
end
