require 'pp'

RSpec.describe ShorturlAt do
  it "has a version number" do
    expect(ShorturlAt::VERSION).not_to be nil
  end

  it "has a service url" do
    expect(ShorturlAt::SHORTEN_URL).not_to be nil
  end

  it "shortens my long url" do
  	long_url = 'http://my.super.long.url/'
  	short_url = ShorturlAt.shorten(long_url)
  	pp "#{long_url} => #{short_url}"
	expect(short_url).to match (/shorturl\.at/)
  end
end
