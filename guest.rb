class Guest

  attr_reader :name, :favourite_song, :is_competitor
  attr_accessor :cash, :tab, :points

  def initialize(name, cash, favourite_song, tab, is_competitor)
    @name = name
    @cash = cash
    @favourite_song = favourite_song
    @tab = tab
    @is_competitor = is_competitor
    @points = 0
  end

  def decrease_guest_cash(amount)
    @cash -= amount
  end

  def increase_guest_tab(amount)
    @tab += amount
  end

end
