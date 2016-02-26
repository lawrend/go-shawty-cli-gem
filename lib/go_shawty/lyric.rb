class GoShawty::Lyric
  attr_accessor :song_name, :lines

  def initialize
    song_number = 1 +rand(6)
    assign_song(song_number)
  end

  
  def assign_song(song_number)
    song_one = "http://www.allthelyrics.com/lyrics/50_cent/in_da_club_radio_edit-lyrics-899426.html"
    song_two = "http://www.allthelyrics.com/lyrics/50_cent/candy_shop_feat_olivia-lyrics-221387.html"
    song_three = "http://www.allthelyrics.com/lyrics/50_cent/21_questions-lyrics-751.html"
    song_four = "http://www.allthelyrics.com/lyrics/50_cent/pimp_radio_edit-lyrics-899432.html"
    song_five = "http://www.allthelyrics.com/lyrics/50_cent/just_a_lil_bit_radio-lyrics-1158816.html"
    song_six = "http://www.allthelyrics.com/lyrics/50_cent/if_i_cant_clean_version-lyrics-559991.html"
    selection = ""

    case song_number
    when 1
      selection = song_one
    when 2
      selection = song_two
    when 3
      selection = song_three
    when 4
      selection = song_four
    when 5
      selection = song_five
    when 6
      selection = song_six
    end
    selection
    binding.pry
  end
  

  #def song(selection)
   # assign_song(song_number)

  end
