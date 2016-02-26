class GoShawty::Celebrity
  attr_accessor :name, :year, :bio

  def self.date

    celeb_1 = self.new
    celeb_1.name = "Tom Cruise"
    celeb_1.year = "1960"
    celeb_1.bio = "He is short but mighty."

    celeb_2 = self.new
    celeb_2.name = "Tom Hanks"
    celeb_2.year = "1955"
    celeb_2.bio = "He is definitely the taller Tom."

    [celeb_1, celeb_2]
  end

end
