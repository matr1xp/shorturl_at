require "shorturl_at/version"
require "http"
require "nokogiri"

module ShorturlAt
  
  SHORTEN_URL = 'https://www.shorturl.at/shortener.php'
  TINY_URL = 'https://tinyurl.com/create.php'

  class Error < StandardError; end
  
  class << self
	attr_accessor :long_url

	def shorten(long_url, method='')
		case method
		when 'tinyurl'
			shorten_tiny_url(long_url)
		when 'rebrandly'
			shorten_rebrandly
		else
			response = HTTP.post(SHORTEN_URL, :form => {:u => long_url})
	    	if response.status.success?
	      		doc = Nokogiri::HTML(response.body.to_s)
	      		short_url = doc.at('input#shortenurl')['value']
	      		short_url = "http://#{short_url}" 
	    	end
	    	short_url
	    end
	end

	def shorten_tiny_url(long_url)
		response = HTTP.post(TINY_URL, :form => {:url => long_url})
    	if response.status.success?
      		doc = Nokogiri::HTML(response.body.to_s)
      		short_url = doc.at('a#copy_div')['href']
    	end
    	short_url
	end

	def shorten_rebrandly(long_url)

	end


  end
end
