class Tender < ActiveRecord::Base
	#attr_accessible :name, :contracttype, :purchasestatus, :changedate, :purchasestart, :purchasefinishdate, :purchaseplace, :contractdate, :price, :pricetext, :finishprice, :contractsubject, :tenderofficiallink, :tenderofficialname, :comment, :link, :tenderclassific, :paymentform, :paymentcondition, :tradecategory, :registereddate, :purchasedestination, :contactwith, :contactwithposition
#	belongs_to :import
@@import_api_hash = {
							 tid: 'Id',
					 		name: 'Name',
	 		contracttype: 'ContractType',
 		purchasestatus: 'PurchaseStatus',
		 		changedate: 'ChangeDate',
		 purchasestart: 'PurchaseStart',
purchasefinishdate: 'PurchaseFinishDate',
 	# 	 purchaseplace: 'PurchasePlace',
#  contractdate:'ContractDate',
#  price:               'Price',
#  pricetext:           'PriceText',
#  finishprice:         'FinishPrice',
#  contractsubject:     'ContractSubject',
						comment: 'Comment',
							 link: 'Link'
# tenderclassific: 'TenderClassific',
# tenderofficiallink: 'TenderOfficialLink',
# tenderofficialname: 'TenderOfficialName',
# paymentform: 'PaymentForm',
		paymentcondition: 'PaymentCondition',
			 tradecategory: 'TradeCategory',
			registereddate: 'RegisteredDate',
 purchasedestination: 'PurchaseDestination',
				 contactwith: 'ContactWith',
 contactwithposition: 'ContactWithPosition'
}

	def from_xml_hash

	end

end
