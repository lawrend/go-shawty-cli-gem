class GoShawty::CelebrityScraper

  def self.scrape_bday_page(month, day)
    url = "http://www.who2.com/born-on/#{month}-#{day}/?drupal_photo=true#"
    celeb_page = Nokogiri::HTML(open(url))
    celebrities = []
    celeb_page.css("li.archive-list-item").each do |celebrity|
    info = {
      :name => celebrity.css("h3.entry-title a")[0].text, 
      :year => celebrity.css("span.h5 a").text, 
      :desc => celebrity.css("div.entry-summary").text.gsub(/(\t|\r|\n)/, ""),
      :info_link => celebrity.css("h3.entry-title a")[0].attribute("href").value
      }
      celebrities << info
    end
    celebrities
  end

end