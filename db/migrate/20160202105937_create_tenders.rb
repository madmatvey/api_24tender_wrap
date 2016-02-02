class CreateTenders < ActiveRecord::Migration
  def change
    create_table :tenders do |t|
      t.integer :tender_id
      t.string :tid
      t.string :name
      t.string :contracttype
      t.string :purchasestatus
      t.string :changedate
      t.string :purchasestart
      t.string :purchasefinishdate
      t.string :purchaseplace
      t.string :contractdate
      t.string :price
      t.string :pricetext
      t.string :finishprice
      t.string :contractsubject
      t.string :tenderofficiallink
      t.string :tenderofficialname
      t.string :comment
      t.string :link
      t.string :tenderclassific
      t.string :paymentform
      t.string :paymentcondition
      t.string :tradecategory
      t.string :registereddate
      t.string :purchasedestination
      t.string :contactwith
      t.string :contactwithposition

      t.timestamps null: false
    end
  end
end
