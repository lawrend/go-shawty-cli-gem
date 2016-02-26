class GoShawty::CLI
  attr_accessor :day_count

  def call
    puts "\n*** A Celebrity Birthday & A Curtis Jackson Lyric ***\n\n          -----What more do you need?-----\n\n"
    puts "Let's go, shawty, and find out who was born on ya birthday."
    date_input
    generate_lyric
    list_celebrities
  end

  def date_input
    puts "\nIn what month were you born? (1-12)\n"
    puts "1. Jan            7. Jul"
    puts "2. Feb            8. Aug"
    puts "3. Mar            9. Sept"
    puts "4. Apr            10. Oct"
    puts "5. May            11. Nov"
    puts "6. June           12. Dec"

    @day_count = 0

    input = gets.strip
    case input
    when "1"
      @day_count = 0
      thirty_one_day_input
    when "2"
      @day_count = 31
      feb_day_input
    when "3"
      @day_count = 60
      thirty_one_day_input
    when "4"
      @day_count = 91
      thirty_day_input
    when "5"
      @day_count = 121
      thirty_one_day_input
    when "6"
      @day_count = 152
      thirty_day_input
    when "7"
      @day_count = 182
      thirty_one_day_input
    when "8"
      @day_count = 213
      thirty_one_day_input
    when "9"
      @day_count = 244
      thirty_day_input
    when "10"
      @day_count = 274
      thirty_one_day_input
    when "11"
      @day_count = 305
      thirty_day_input
    when "12"
      @day_count = 335
      thirty_one_day_input
    else
      puts "Say what now?"
      date_input
    end
  end

  def thirty_one_day_input
    puts "\nSweet.  What day? (1-31)"
    input = gets.to_i
    if input < 32 && input > 0
      @day_count += input
    else 
      puts "Can you do that again for me?"
      thirty_one_day_input
    end
  end

  def thirty_day_input
    puts "\nSweet.  What day? (1-30)"
    input = gets.to_i
    if input <31 && input > 0
      @day_count += input
    else 
      puts "Can you do that again for me?"
      thirty_day_input
    end
  end

  def feb_day_input
    puts "\nSweet.  What day? (1-29)"
    input = gets.to_i
    if input < 30 && input > 0
      @day_count += input
    else
      puts "Can you do that again for me?"
      feb_day_input
    end
  end

  def generate_lyric
    puts "\nOkay.  Here's your 50 Cent Lyric that will guide you in your celebration:\n*****pretend he wrote it just for you*****"
    GoShawty::Lyric.new

    puts "\n\n       (Lyric)\n"
    puts "Source: Song Name"
  end

  def list_celebrities
    puts "\nAnd here are the celebrities who share your birthday!  Pick one!  Celebrate together!  Sing the lyric!!!\n"
    puts "1. Person - Year\nBio"
    puts "2. Person - Year\nBio"
    puts "3. Person - Year\nBio"
    puts "4. Person - Year\nBio"
    puts "5. Person - Year\nBio"

    puts "\nSelect the number of any person you'd like to learn more about, or you can pick a (D)ifferent date, or you can (E)xit and head to da club."
  end

  def goodbye
    puts"Aight.  C-ya."
  end


end