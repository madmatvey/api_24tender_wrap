class Import < ActiveRecord::Base
# has_many :tenders
  
  before_save :parse_file

  def parse_file
    doc = Nokogiri.XML(open("http://24tender.ru/api/trades/search?modifiedFrom=2013-01-01T00:00&modifiedTo="+Time.now.xmlschema)) #, nil, "windows-1251")
    doc.encoding = 'utf-8'
    parse_xml(doc)
  end

  def parse_xml(doc)
    doc.root.elements.each do |node|
      parse_tenders(node)
    end
  end

  def parse_tenders(node)
    if node.node_name.eql? 'tender'
      tmp_tender = Tender.new
      node.elements.each do |node|
        tmp_tender.tid                  = node.text.to_s if node.name.eql? 'Id'
        tmp_tender.name                 = node.text.to_s if node.name.eql? 'Name'
        tmp_tender.contracttype         = node.text.to_s if node.name.eql? 'ContractType'
        tmp_tender.purchasestatus       = node.text.to_s if node.name.eql? 'PurchaseStatus'
        tmp_tender.changedate           = node.text.to_s if node.name.eql? 'ChangeDate'
        tmp_tender.purchasestart        = node.text.to_s if node.name.eql? 'PurchaseStart'
        tmp_tender.purchasefinishdate   = node.text.to_s if node.name.eql? 'PurchaseFinishDate'
        tmp_tender.purchaseplace        = node.text.to_s if node.name.eql? 'PurchasePlace'
        tmp_tender.contractdate         = node.text.to_s if node.name.eql? 'ContractDate'
        tmp_tender.price                = node.text.to_s if node.name.eql? 'Price'
        tmp_tender.pricetext            = node.text.to_s if node.name.eql? 'PriceText'
        tmp_tender.finishprice          = node.text.to_s if node.name.eql? 'FinishPrice'
        tmp_tender.contractsubject      = node.text.to_s if node.name.eql? 'ContractSubject'
        tmp_tender.tenderofficiallink   = node.text.to_s if node.name.eql? 'Comment'
        tmp_tender.tenderofficialname   = node.text.to_s if node.name.eql? 'Link'
        tmp_tender.comment              = node.text.to_s if node.name.eql? 'TenderClassific'
        tmp_tender.link                 = node.text.to_s if node.name.eql? 'TenderOfficialLink'
        tmp_tender.tenderclassific      = node.text.to_s if node.name.eql? 'TenderOfficialName'
        tmp_tender.paymentform          = node.text.to_s if node.name.eql? 'PaymentForm'
        tmp_tender.paymentcondition     = node.text.to_s if node.name.eql? 'PaymentCondition'
        tmp_tender.tradecategory        = node.text.to_s if node.name.eql? 'TradeCategory'
        tmp_tender.registereddate       = node.text.to_s if node.name.eql? 'RegisteredDate'
        tmp_tender.purchasedestination  = node.text.to_s if node.name.eql? 'PurchaseDestination'
        tmp_tender.contactwith          = node.text.to_s if node.name.eql? 'ContactWith'
        tmp_tender.contactwithposition  = node.text.to_s if node.name.eql? 'ContactWithPosition'
      end
      self << tmp_tender
    end
  end

end
