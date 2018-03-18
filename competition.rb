class Competition

  attr_reader :guests
  attr_accessor :competitors

  def initialize(guests)
    @guests = guests
    @competitors = []
  end

  def create_competitor_list()
    binding.pry
    @guests.each {|guest|
      if guest.is_competitor
      @competitors.push(guest)
      end
    }
    binding.pry
  end


end
