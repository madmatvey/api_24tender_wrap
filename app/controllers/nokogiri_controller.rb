class NokogiriController < ApplicationController
  def index
    require 'open-uri'
    require 'sequel'
    
    imports = Import.all
    import = Import.new
    if imports.size == 0
      import.time_from = Time.parse("2013-01-01T00:00").to_i
    else 
      import.time_from = imports.last.time_to
    end
    import.time_to = Time.now.to_i

    if import.time_from + 300 > Time.now.to_i
      results = "OOPS! There are no 5 minutes from last import being.\n Now is #{Time.now} and last import was #{Time.at(import.time_from)} \n Wait for a #{Time.now.to_i - import.time_from - 300} seconds"
    else 
      apiurl = "http://24tender.ru/api/trades/search?modifiedFrom="+Time.at(import.time_from).xmlschema+"&modifiedTo="+Time.at(import.time_to).xmlschema+"&page=1"

      doc = Nokogiri.XML(open(apiurl))
      doc.encoding = 'utf-8'
      data = Hash.from_xml(doc.to_s)
      xml_pages_count = data["source"]["PagesCount"].to_i
     
      tenders = data["source"]["tender"]

      if xml_pages_count > 1
        page = 2
        (xml_pages_count-1).times do
          apiurl = "http://24tender.ru/api/trades/search?modifiedFrom="+Time.at(import.time_from).xmlschema+"&modifiedTo="+Time.at(import.time_to).xmlschema+"&page="+page.to_s
          doc = Nokogiri.XML(open(apiurl))
          doc.encoding = 'utf-8'
          data = (Hash.from_xml(doc.to_s))
          tenders += data["source"]["tender"]
          page += 1
        end
      end

      tenders_array_to_save = []

      if tenders != nil
        results = tenders 
        import.save
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
          # tmp_tender.save
          tenders_array_to_save << tmp_tender
        end
        ActiveRecord::Base.transaction do
          tenders_array_to_save.map {|tender| tender.save! } 
        end
      else
        results = "OOPS! There are no new tenders in database!" 
      end
    end  
    # render the output as plain text page
    render :text => results, :content_type => 'text/plain'
  end
end
