require 'nokogiri'
require 'open-uri'

# Find out how to scrape: https://coinmarketcap.com/all/views/all/ using 'nokogiri'

# Open desired URL and stock it in an object named 'page'
page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))

# The XPath was extracted by inspectin the codesource and copying XPath element
#//*[@id="__next"]/div[1]/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr[1]/td[3]/div

# Extracts HTML elements and stocks them in the array 'cryto_name' and 'crypto_price'
 crypto_name = page.xpath("/html/body/div/div[1]/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr/td[3]/div").map { |name| name.text }
 crypto_price = page.xpath("/html/body/div/div[1]/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr/td[5]/a").map { |price| price.text }


# crypto_price.each do |crypto_price|
#   puts crypto_price.text #ou n'importe quelle autre opération de ton choix ;)
# end

# Gets all 'cryto_name' and applies .text to each one. Text extracts the text of each element in this array
  # crypto_name.each do |crypto_name|
  #   puts crypto_name.text #ou n'importe quelle autre opération de ton choix ;)
  # end
def final_array_of_hashes(name, price)
  crypto_array = Array.new
  name.length.times do | cryp_index |
    crypto_hash = Hash.new
    crypto_hash[name[cryp_index]] = price[cryp_index]
    crypto_array << crypto_hash
  end
  crypto_array
end
 #crypto_hash = crypto_name.zip(crypto_price)
 #crypto_hash = Hash[crypto_name[0].zip(crypto_price[0])]
 
 puts final_array_of_hashes(crypto_name, crypto_price)
 