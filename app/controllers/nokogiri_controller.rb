class NokogiriController < ApplicationController
  def index
    # Load the xml file into a String
    require 'open-uri'
   
    doc = Nokogiri.XML(open("http://24tender.ru/api/trades/search?modifiedFrom=2013-01-01T00:00&modifiedTo=2016-12-01T00:00", 'r:windows-1251').read) #, nil, 'CP1251')
    
    results = doc.to_html
    
    # render the output as plain text page
    render :text => results, :content_type => 'text/plain'
  end
end
