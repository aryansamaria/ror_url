# def scrap(url)
#   require 'nokogiri'
#   require 'open-uri'

#   begin
#     doc = Nokogiri::HTML(URI.open(url))

#   rescue OpenURI::HTTPError => e 
#     description = "Fail"
#   rescue StandardError => e 
#     description = 'an error occured'  

require 'nokogiri'
require 'open-uri'

url= 'https://www.scrapethissite.com/'

doc = Nokogiri::HTML(URI.open(url))
description = doc.at('meta[name="description"]')['content']
description += "\n" + doc.at('title').text.strip if doc.at('title')
description += "\n" + doc.at('p').text.strip if doc.at('p')




puts description