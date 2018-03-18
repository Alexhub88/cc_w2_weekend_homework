class Competition

  attr_reader :guests
  attr_accessor :competitors

  def initialize(guests)
    @guests = guests
    @competitors = []

  end

  def create_competitor_list()
    @guests.each {|guest|
      if guest.is_competitor
        @competitors.push(guest)
      end
    }
  end

  def sing_favourite_songs(guests)
    lyrics = {
      "Ruby Tuesday" => "Goodbye, Ruby Tuesday, who could hang a name on you?",
      "Jumpin' Jack Flash" => "I'm Jumpin' Jack Flash, it's a gas, gas, gas!",
      "Paint It Black" => "I see a red door and I want to paint it black..."
    }
    guests.each do |guest|
      song = guest.favourite_song
      puts ""
      p lyrics[song]
      puts ""
    end
  end

  def judges_score_performances(guests)
    i = 1
    guests.each do |guest|
      guest.points = i*10
      i += 1
    end
  end

  def judges_declare_winner(guests)
    winner_index = 0
    for i in 0..guests.length - 2
      next_guest = guests[i+1]
      current_guest =  guests[i]
      if next_guest.points > current_guest.points
        winner_index = i + 1
      end
    end
    return guests[winner_index]
  end

end
