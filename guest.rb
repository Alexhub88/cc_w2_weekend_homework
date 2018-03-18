class Guest

  attr_reader :name, :favourite_song
  attr_accessor :cash, :tab

  def initialize(name, cash, favourite_song, tab)
    @name = name
    @cash = cash
    @favourite_song = favourite_song
    @tab = tab
  end

  def increase_guest_tab(amount)
    @tab += amount
  end

end
