module Taiga

  class Disks
    attr_accessor :front_or_back, :delt_disk, :disk

    def initialize
      @front_or_back = []
      @delt_disk = []

      @disk = []
      @disk[0]= {1 => "red fox", 2 => "porcupine"}
      @disk[1]= {1 => "red fox", 2 => "beaver"}
      @disk[2]= {1 => "red fox", 2 => "snowy owl"}
      @disk[3]= {1 => "red fox", 2 => "caribou"}
      @disk[4]= {1 => "porcupine", 2 => "beaver"}
      @disk[5]= {1 => "porcupine", 2 => "snowy owl"}
      @disk[6]= {1 => "porcupine", 2 => "caribou"}
      @disk[7]= {1 => "beaver", 2 => "snowy owl"}
      @disk[8]= {1 => "beaver", 2 => "caribou"}
      @disk[9]= {1 => "snowy owl", 2 => "caribou"}
    end


    def deal_disk
      @front_or_back = 10.times.map{1+Random.rand(2)}.to_a
      @delt_disk = [0,1,2,3,4,5,6,7,8,9].shuffle
      until less_then_four_animals do
        deal_disk
      end
    end
   

    def draw_board
      @delt_disk.zip(@front_or_back) do |i, j|
        puts "Disk ##{i+1} #{@disk[i][j]}"
      end
    end

    def less_then_four_animals
      red_fox = 0
      beaver = 0
      snowy_owl = 0
      porcupine = 0
      caribou = 0
      
      @delt_disk.zip(@front_or_back) do |i, j|
        if @disk[i][j] == "red fox"
          red_fox += 1
        elsif @disk[i][j] == "beaver"
          beaver += 1
        elsif @disk[i][j] == "snowy owl"
          snowy_owl += 1
        elsif @disk[i][j] == "porcupine"
          porcupine += 1
        else
          caribou += 1
        end
      end
      return beaver < 4 && snowy_owl < 4 && red_fox < 4 && porcupine < 4 && caribou < 4
    end


    def flip_disk(disk_number)
      index = @delt_disk.index(disk_number-1)

      if front_or_back[index] == 1
        front_or_back[index] = 2
      elsif front_or_back[index] == 2
        front_or_back[index] = 1
      end
      draw_board
    end

  end


  class Cards

    attr_accessor :delt_cards, :used_cards, :current_card, :players_cards

    def initialize
      @delt_cards = Array.new
      @card = Array.new
      @used_cards = Array.new 
      @current_card = Array.new
      @players_cards = Array.new

      @card[0] = "red fox"
      @card[1] = "red fox"
      @card[2] = "snowy owl"
      @card[3] = "snowy owl"
      @card[4] = "caribou"
      @card[5] = "caribou"
      @card[6] = "porcupine"
      @card[7] = "porcupine"
      @card[8] = "beaver"
      @card[9] = "beaver"
    end

    def deal_cards 
      @delt_cards = [0,1,2,3,4,5,6,7,8,9].shuffle
    end

    def pick_up_card_from_deck
      i = @delt_cards.pop
      @current_card[i] = @card[i]
      puts "Current Card:#{i} #{@current_card[i]}"
      puts @delt_cards
    end

  end

end

board = Taiga::Disks.new
cards = Taiga::Cards.new
board.deal_disk
board.draw_board
cards.deal_cards
cards.pick_up_card_from_deck
