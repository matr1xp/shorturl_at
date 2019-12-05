require "shorturl_at/version"
require "http"
require "nokogiri"

module ShorturlAt
  
  SHORTEN_URL = 'https://www.shorturl.at/shortener.php'

  class Error < StandardError; end
  
  class << self
	attr_accessor :long_url

	def shorten(long_url)
		response = HTTP.post(SHORTEN_URL, :form => {:u => long_url})
	    if response.status.success?
	      doc = Nokogiri::HTML(response.body.to_s)
	      short_url = doc.at('input#shortenurl')['value']
	      short_url = "http://#{short_url}" 
	    end

	    short_url
	end

  end
end
