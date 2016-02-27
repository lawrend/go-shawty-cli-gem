class GoShawty::CLI
  attr_accessor :day_count, :month, :day

  def call
    puts "\n*** A Celebrity Birthday & A Curtis Jackson Lyric ***\n\n          -----What more do you need?-----\n\n"
    puts "Let's go, shawty, and find out who was born on ya birthday."
    date_input
    generate_lyric
    list_celebrities
  end

#####--GETTING THE USER BIRTHDAY--#####

  def date_input
    puts "\n** In what month were you born? (1-12)\n"
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
      @month = "january"
      @day_count = 0
      thirty_one_day_input
    when "2"
      @month = "february"
      @day_count = 31
      feb_day_input
    when "3"
      @month = "march"
      @day_count = 60
      thirty_one_day_input
    when "4"
      @month = "april"
      @day_count = 91
      thirty_day_input
    when "5"
      @month = "may"
      @day_count = 121
      thirty_one_day_input
    when "6"
      @month = "june"
      @day_count = 152
      thirty_day_input
    when "7"
      @month = "july"
      @day_count = 182
      thirty_one_day_input
    when "8"
      @month = "august"
      @day_count = 213
      thirty_one_day_input
    when "9"
      @month = "september"
      @day_count = 244
      thirty_day_input
    when "10"
      @month = "october"
      @day_count = 274
      thirty_one_day_input
    when "11"
      @month = "november"
      @day_count = 305
      thirty_day_input
    when "12"
      @month = "december"
      @day_count = 335
      thirty_one_day_input
    else
      puts "Say what now?"
      date_input
    end
  end

  def thirty_one_day_input
    puts "\n** Sweet.  What day? (1-31)"
    input = gets.to_i
    if input < 32 && input > 0
      @day = input.to_s
      @day_count += input
    else 
      puts "Can you do that again for me?"
      thirty_one_day_input
    end
  end

  def thirty_day_input
    puts "\n** Sweet.  What day? (1-30)"
    input = gets.to_i
    if input <31 && input > 0
      @day = input.to_s
      @day_count += input
    else 
      puts "Can you do that again for me?"
      thirty_day_input
    end
  end

  def feb_day_input
    puts "\n** Sweet.  What day? (1-29)"
    input = gets.to_i
    if input < 30 && input > 0
      @day = input.to_s
      @day_count += input
    else
      puts "Can you do that again for me?"
      feb_day_input
    end
  end

#####--GIVING USER A LYRIC--#####

  def generate_lyric
    if month == "july" && day == "6"
      curtis_bday_song
    else
      puts "\nOkay.  Here's your 50 Cent Lyric that will guide you in your celebration:\n*****pretend he wrote it just for you*****"
      bday_lyric = GoShawty::Lyric.new
      puts"Song: #{bday_lyric.song_name}\n"
      puts "#{bday_lyric.album_name}\n"
      puts "\n\n#{bday_lyric.lines}\n"
    end
  end

  #####--GIVING USER A LIST OF CELEBS--#####

  def list_celebrities
    if month == "july" && day == "6"
      curtis
    else
      puts "\nAnd here are the celebrities who share your birthday!  Celebrate together!  Sing the lyric TOGETHER!!!\n"
      generate_list
    end
  end

  def generate_list
    array = GoShawty::CelebrityScraper.scrape_bday_page(month, day)
    counter = 1
    array.each do |i|
      puts "#{counter}. #{i[:name]} born in #{i[:year]} - #{i[:desc]}\n"
      counter += 1
    end
    puts "\n** Select the number of any person you'd like to learn more about, or you can pick a (D)ifferent date, or you can (E)xit and head to da club."
    input = gets.strip

    if /d/i === input
      self.call
    elsif /e/i === input
      goodbye
    elsif input.to_i <= array.length
      more_info(input.to_i, array)
    else
      goodbye
    end 
  end

#####--GIVE MORE INFO ABOUT CELEB--#####
  def more_info(selector, array)
    target_celeb_url = array[selector-1][:info_link]
    know_more = GoShawty::CelebrityMaker.scrape_celeb_page(target_celeb_url)

    puts "#{know_more.age}\n#{know_more.born}\n#{know_more.died}\n#{know_more.birthplace}"
    puts "\n\n"
    puts "#{know_more.bio}\n"

    puts "\n** Do you want to know more about another (P)erson who shares this birthday, check on a (D)ifferent birthday, or (E)xit?"

    input = gets.strip

    if /p/i === input
      list_celebrities
    elsif /d/i === input
      self.call
    else
      goodbye
    end
  end


#####--SPECIAL METHODS FOR JULY 6 BDAYS--#####

  def curtis_bday_song
    da_club = Nokogiri::HTML(open("http://www.allthelyrics.com/lyrics/50_cent/in_da_club_radio_edit-lyrics-899426.html"))
    sing_along = da_club.css("div.content-text-inner p").text
    puts "\n\nYou have the birthday of all birthdays. You share a birthday with Curtis Jackson. So sing with me now..."
    puts"--------------------------------------------------------------------------------------------------------------------"
    puts "#{sing_along}"
  end

  def curtis
    puts"July 6th is the birthday of you AND..."
    puts "
 +====================+      ~MMMMMMMMMMMMMMN~          DD7IIIIIII7II?7II7+.                        
 MMMMMMMMMMMMMMMMMMMMMM   ,MMMMMMMMMMMMMMMMMMMM,  .+777$$7III7777777ZN$M?7I7:.                      
 MMMMMMMMMMMMMMMMMMMMMM   MMMMMMMMMMMMMMMMMMMMMM~:I7777$$$$Z$77I777$M8MM$NNN7I.                     
 MMMMMMMMMMMMMMMMMMMMMM   MMMMMMNMMMMMMMMMMMMMMMM+I77$$$$$$$Z888$I7MIIMM77$ZIII,.                   
 MMMMMMMMMMMMMMMMMMMMMM   MMMMMMMMMMMMMMMMMMMMMMN?77$$$$$888888O888II$DMINNN77II.                   
 MMMMMMMMMM               MMMMMMMMMM   MMMMMMMMMNMMMMMMMMMNDDD8888O8877ZM877777II.                  
 MMMMMMMMMM               MMMMMMMMMM   MMMMMMMMMMMMNDDDDDDDDNMMND88$$88ZI7I77777I?.                 
 MMMMMMMMMM               MMMMMMMMMM   MMMMMMMMMM+IO88DDDDDD8DDMND8O?+D87I77777III.                
 MMMMMMMMMM  .MMMMMMMM.   MMMMMMMMMM   MMONMMMMMM,=$888DDDDDDNNDDDNMD88OOO8$777777I?.               
 MMMMMMMMMMMMMMNMMMMMMM.  MMMMMMMMMM   MMMMMMMMM+:=?$ZZ8O8888DDDNNNMMND88888O77777Z7.               
 MMMMMMMMMMMMMMMMMMMMMMM  MMMMMMMMMM   MMMMMMMM7IDNNDOO+?77$$OODDDDNNMMN888OO8$I7$Z+.               
 MMMMMMMMMMMMMMMMMMMMNMM  MMMMMMMMMM   MMMMMMMO$8OODDDD8$$77ODDNDNDNMMMMMD88888O7ZO.                
 MMMMMMMMMMMMMMMMMMMMMMM  NNMMMMMMMM   MMMMMMMM=$ZZZ78NNDD8O8DDDDOZZODMMMMD88888OI?.                
 MMMMMMMMMM+  MMMMMMMMMM  MMMMMMMMMM   MMMMMMMM:7O$88ZODDO$OZ8DD$I7Z888NNMMN888O8$:.                
              MMMMMMMMMM  MMMMMMMMMM   MMMMMMMM?8MDOMDOD$ZOO88Z?DNMMND8DDNMMDD88OO~.                
              MNMMMMMMMM  MMMMMMMMMM   MMMMMMM$:=?$ZZOO77ZOOOOO8OD8D8D88DNNMMD888O:.                
 .MMMMMMMM.   MMMMMNMMMM  MMMMMMMMMM   MMMMMMM.+??7I+?7?++7O8$I$I?I7$O8DDNNMMND88Z.                 
 MMMMMMMMMM   MMMMMMMMMM  MMMMMMMMMM   MMMMMMM+$777$NDZII$$II$I?IIII$Z88DDDDMMD8$.                  
 MMMMMMMMMM   MMMMMMMMMM  MMMMNMMMMM   MMMMMMMI$$$$7$?DND$8N7DI?I777ZO8D888ZDNO7.                   
 MMMMMMMMMM   MMMMMMMMMM  MMMMMMMMMM   MMMMMMMI7Z$777D8Z$O8ZZZ7?I77ZOD88OOZD$Z~.                    
 MMMMMMMMMM   MMMMMMMMMM  MMMMMMMMMM   MMMMMMM??ZO$O87I8IDND8OZ77$7O88D88OD87D+,.                   
 MMMMMMMMMM   MMMMMMMMMM  MMMMMMMMMM   MMMMMMM??$78$DOZZZZZZD888OZO88DD88ND$O$O~.                   
 MMMMMMMMMM   MMMMMMMMMM  MMMMMMMMMM   MMMMMMM7IIDDNNI~=~INDO8ND8888DDDDNMDI$77..                   
 MMMMMMMMMM   MMMMMMMMMM  MMMMMMMMMM   MMMMMMM8IIDD$7~~::~IZ8OD8D8DDDDDMNN8?Z+...                   
 MMMMMMMMMMMMMMMMMMMMMMM  +MMMMMMMMMMMMMMMMMMMD8$M8OO$7??$$OO8NDDNNNNNMMMN$7.....                   
 8MMMMMMMMMNMMMMMNNMMMMN   MMMMMMMMMMMMMMMMMNMMONND78DDDN88888DMMNNMNMMMND7O.....,.                 
  MMMMMMMMNMMMMMMMMMMMM     MMMMMMMMMMMMMMMMMMMOZ$DDDDNND888D88MNNNMMMMMNO$I.......                 
   $NMMMMMMMMMNMMMMMMM       MMMMMMMMMMMMMMMMMM.77NNNNDDD8DDDDNNMMMMMMMMN87$..~.....                
                                                 ,8DMMMNMMMMMMNMMMMMMMMMNN87.,..I .                 
 .MMMMMMMMMM.  MMMMMMMM  MMMMI    MMM MMMMMMMMMMM. 8MMMMMMMMMMMMMMMMMMMMMMNO.,.... ......           
 8MMMMMMMMMMN  MMMMMMMM  MMMMMI   MMM MMMMMMMMMMM  ,.ZMMMMMMMMMMMMMNNNMMMMM~=:,..........           
 MMMM    MMMM  MMMM      MMMMMM?  MMM    MMMMM     ,=,OMMNNMNNNNNDDDNNNMMM~,.,...I$8Z:.....         
 MMMM          MMMMMMMM  MMMMMMM. MMM    MMMMM    ..,?,NNNNMMMNNMN8DDNDO.:7.,..,,.. ,Z7Z,.....      
 MMMM          MMMMMMMM  MMMMMMMMMMMM    MMMMM    ...,=OMNNNNNNMNDD7....:I,,,.:,=.....,:,...:+..    
 MMMM          MMMM      MMMM`MMMMMMM    MMMMM      ..?7NNNNNNND.......~I,,,,..,,,...,.......?=.    
 MMMM    MMMM  MMMM      MMMM `MMMMMM    MMMMM     ...=?DDD8,.. .....:.+,,,,.,,....,:........7:..  
 8MMMMMMMMMMN  MMMMMMMM  MMMM   MMMMM    MMMMM  .....:.............,,.7,,,,..,....................  
  MMMMMMMMMM   MMMMMMMM  MMMM    MMMM    MMMMM .....:,.. ......,,..,,7.,,,........................  
                                              ....,.:........,...,:.+,,,............................
                                              .:.,.=:...........,=~7.,............:..........,......
                                        .......,..,:...........,,7I,..............,......,,.,.......
                                        .....,,..:I...........,~?,,,,.............,....,...:........"

    puts "\n...and if you need to know who else..."
    generate_list
  end

  def goodbye
    puts"Aight.  C-ya at da club."
  end


end