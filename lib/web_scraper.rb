require "nokogiri"
require "open-uri"

class WebScraper
  def self.get_title(url)
    charset = nil
    html = open(url) do |f|
      charset = f.charset
      f.read
    end
    
    doc = Nokogiri::HTML.parse(html, nil, charset)
    doc.title
  end
end