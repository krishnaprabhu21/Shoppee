class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.string :offername
      t.string :offerstartdate
      t.string :offerenddate
      t.string :offerdescription

      t.timestamps null: false
    end
  end
end
