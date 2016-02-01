class NokogiriController < ApplicationController
  def index
    require 'open-uri'
    require 'sequel'

    doc = Nokogiri.XML(open("http://24tender.ru/api/trades/search?modifiedFrom=2013-01-01T00:00&modifiedTo="+Time.now.xmlschema)) #, nil, "windows-1251")
    doc.encoding = 'utf-8'
    
    results = doc.to_html
    
    # render the output as plain text page
    render :text => results, :content_type => 'text/plain'
  end
end
