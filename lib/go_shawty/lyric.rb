class GoShawty::Lyric
  attr_accessor :album_name, :song_name, :lines

  def initialize
    song_number = 1 +rand(6)
    get_lyric(song_number)
  end


  def get_lyric(song_number)

    url = ""
    lyric_array = []

    case song_number
    when 1
      url = "http://www.allthelyrics.com/lyrics/50_cent/in_da_club_radio_edit-lyrics-899426.html"
      lyric_array = [0,1,2,4,5,7]
    when 2
      url = "http://www.allthelyrics.com/lyrics/50_cent/candy_shop_feat_olivia-lyrics-221387.html"
      lyric_array = [0,1,2,4,5]
    when 3
      url = "http://www.allthelyrics.com/lyrics/50_cent/21_questions-lyrics-751.html"
      lyric_array = [1,2,3,4,5,6,7]
    when 4
      url = "http://www.allthelyrics.com/lyrics/50_cent/pimp_radio_edit-lyrics-899432.html"
      lyric_array = [1,2,4,6,8]
    when 5
      url = "http://www.allthelyrics.com/lyrics/50_cent/just_a_lil_bit_radio-lyrics-1158816.html"
      lyric_array = [0,1,2,3,4,5,6]
    when 6
      url = "http://www.allthelyrics.com/lyrics/50_cent/if_i_cant_clean_version-lyrics-559991.html"
      lyric_array = [0,1,2,3,4,5,6,7,8,9]
    end
    scraped_lyrics = Nokogiri::HTML(open(url))
    lyric_selection = lyric_array.sample
    @lines = scraped_lyrics.css("div.content-text-inner p")[lyric_selection].text
    @song_name = scraped_lyrics.css("div.clear-block h1.page-title").text
    @album_name = scraped_lyrics.css("div.content-text-album").text
  end

end
