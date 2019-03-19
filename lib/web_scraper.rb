require "nokogiri"

class WebScraper
  def self.get_title(url)
    charset = nil
    html = URI.parse(url).open do |f|
      charset = f.charset
      f.read
    end

    doc = Nokogiri::HTML.parse(html, nil, charset)
    doc.title
  end
end
