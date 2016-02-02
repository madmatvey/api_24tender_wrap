json.array!(@tenders) do |tender|
  json.extract! tender, :id, :name, :contracttype, :purchasestatus, :changedate, :purchasestart, :purchasefinishdate, :purchaseplace, :contractdate, :price, :pricetext, :finishprice, :contractsubject, :tenderofficiallink, :tenderofficialname, :comment, :link, :tenderclassific, :paymentform, :paymentcondition, :tradecategory, :registereddate, :purchasedestination, :contactwith, :contactwithposition
  json.url tender_url(tender, format: :json)
end
