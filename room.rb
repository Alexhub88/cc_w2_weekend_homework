class Room

  attr_reader :name, :max_occupants, :entry_fee

  attr_accessor :occupants, :playlist

  def initialize(name, max_occupants, entry_fee, occupants =[], playlist = [])
    @name = name
    @occupants = occupants
    @entry_fee = entry_fee
    @playlist = playlist
    @max_occupants = max_occupants
  end

  def add_song_to_playlist(song)
    @playlist.push(song)
  end

  def remove_song_from_playlist(song)
    @playlist.delete(song)
  end

  def add_guest_to_occupants(guest)
    if guest_can_afford_entry_fee(guest)
      guest.decrease_guest_cash(@entry_fee)
      @occupants.push(guest)
      return true
    else
      puts "Sorry, pal - no entry. You can't afford this place tonight. And your trainers don't meet the dress code. Oh, am I being unreasonable? Sling yer hook!"
      return false
    end
  end

  def remove_guest_from_rooms(guest)
    @occupants.delete(guest)
  end

  def add_multiple_guests(guests_to_add_array)
    free_space = @max_occupants - @occupants.length
    if guests_to_add_array.length <= free_space
      guests_to_add_array.each do
        |guest| add_guest_to_occupants(guest)
      end
    else
      puts "Not enough places in room to admit guests!"
    end
  end

  def guest_can_afford_entry_fee(guest)
    return (guest.cash >= @entry_fee)
  end

  def guest_favourite_song_on_playlist(guest, playlist)
    playlist = @playlist
    if playlist.find { |song| song.title == guest.favourite_song } != nil
      puts "Wooo Hooooooo!"
      return true
    else
      puts "Awwww.... denied!"
      return false
    end
  end

end
