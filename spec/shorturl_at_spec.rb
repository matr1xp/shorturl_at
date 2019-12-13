RSpec.describe ShorturlAt do
  it "has a version number" do
    expect(ShorturlAt::VERSION).not_to be nil
  end

  it "has a default service url" do
    expect(ShorturlAt::SHORTEN_URL).not_to be nil
  end

  it "shortens my long url (default)" do
  	long_url = 'http://my.super.long.url/one'
  	short_url = ShorturlAt.shorten(long_url)
	  expect(short_url).to match (/shorturl\.at/)
  end

  it "shortens my long url (tinyurl)" do
    long_url = 'http://my.super.long.url/two'
    short_url = ShorturlAt.shorten(long_url, 'tinyurl')
    expect(short_url).to match (/tinyurl\.com/)
  end
  it "shortens my long url (rebrandly)"
end
