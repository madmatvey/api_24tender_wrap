class NokogiriController < ApplicationController
  def index
    require 'open-uri'
    require 'sequel'


    doc = Nokogiri.XML(open("http://24tender.ru/api/trades/search?modifiedFrom=2013-01-01T00:00&modifiedTo="+Time.now.xmlschema)) #, nil, "windows-1251")
    doc.encoding = 'utf-8'
    data = Hash.from_xml(doc.to_s)
    tenders = data["source"]["tender"]

    tenders.each do |node|
      tmp_tender = Tender.new
        tmp_tender.tid                  = node['Id']
        tmp_tender.name                 = node['Name']
        tmp_tender.contracttype         = node['ContractType']
        tmp_tender.purchasestatus       = node['PurchaseStatus']
        tmp_tender.changedate           = node['ChangeDate']
        tmp_tender.purchasestart        = node['PurchaseStart']
        tmp_tender.purchasefinishdate   = node['PurchaseFinishDate']
        tmp_tender.purchaseplace        = node['PurchasePlace']
        tmp_tender.contractdate         = node['ContractDate']
        tmp_tender.price                = node['Price']
        tmp_tender.pricetext            = node['PriceText']
        tmp_tender.finishprice          = node['FinishPrice']
        tmp_tender.contractsubject      = node['ContractSubject']
        tmp_tender.comment              = node['Comment']
        tmp_tender.link                 = node['Link']
        tmp_tender.tenderclassific      = node['TenderClassific']
        tmp_tender.tenderofficiallink   = node['TenderOfficialLink']
        tmp_tender.tenderofficialname   = node['TenderOfficialName']
        tmp_tender.paymentform          = node['PaymentForm']
        tmp_tender.paymentcondition     = node['PaymentCondition']
        tmp_tender.tradecategory        = node['TradeCategory']
        tmp_tender.registereddate       = node['RegisteredDate']
        tmp_tender.purchasedestination  = node['PurchaseDestination']
        tmp_tender.contactwith          = node['ContactWith']
        tmp_tender.contactwithposition  = node['ContactWithPosition']
        tmp_tender.save
    end

    # render the output as plain text page
    render :text => tenders, :content_type => 'text/plain'
  end
end
