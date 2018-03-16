class Room

  attr_reader :name

  attr_accessor :occupants, :playlist

  def initialize(name, occupants =[], playlist = [])
    @name = name
    @occupants = occupants
    @playlist = playlist
  end

  def add_song_to_playlist(song)
    @playlist.push(song)
  end

  def remove_song_from_playlist(song)
    @playlist.delete(song)
  end

  def add_guest_to_occupants(guest)
    @occupants.push(guest)
  end

  def remove_guest_from_rooms(guest)
    @occupants.delete(guest)
  end

end
