class GoShawty::CelebrityMaker
  attr_accessor :age, :born, :died, :birthplace, :known, :bio

  def initialize(age = nil, born = nil, died = "Died: N/A", birthplace = nil, known = nil, bio = nil)
    @age = age
    @born = born
    @died = died
    @birthplace = birthplace
    @known = known
    @bio = bio
  end

  def self.scrape_celeb_page(url)
    new_page = self.new
    celeb_doc = Nokogiri::HTML(open(url))
    celeb_doc.css("div.bio-info-div").each do |fact|
      if 
        fact.text.include? "years"
          new_page.age = fact.text
      elsif 
        fact.text.include? "Born"
          new_page.born = fact.text
      elsif 
        fact.text.include? "Died"
          new_page.died = fact.text
      elsif
        fact.text.include? "Birthplace"
          new_page.birthplace = fact.text
      elsif 
        fact.text.include? "known"
          new_page.known = fact.text
      end
    end
    new_page.bio = celeb_doc.css("div.bio-body p").text
    new_page
  end

end