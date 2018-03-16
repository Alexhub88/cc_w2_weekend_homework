require("minitest/autorun")
require("minitest/rg")
require_relative("../room")
require_relative("../guest")
require_relative("../song")
require('pry')


class RoomTest < MiniTest::Test

  def setup

    @song1 = Song.new("Paint It Black", "The Rolling Stones")
    @song2 = Song.new("Something", "The Beatles")
    @song3 = Song.new("Blue Eyes", "Elton John")
    @song4 = Song.new("Cause I'm a Man", "Tame Impala")
    @playlist = [@song1, @song2]

    @guest1 = Guest.new("Kirk")
    @guest2 = Guest.new("Picard")
    @guest3 = Guest.new("Archer")
    @occupants = [@guest1]

    @room = Room.new(8, @occupants, @playlist)

  end

  def test_room_has_name
    assert_equal(8, @room.name)
  end

  def test_number_of_occupants
    assert_equal(1, @occupants.length)
  end

  def test_number_of_songs
    assert_equal(2, @playlist.length)
  end

  def test_add_song_to_playlist
    @room.add_song_to_playlist(@song4)
    assert_equal(3, @playlist.length)
  end

  def test_remove_song_from_playlist
    @room.remove_song_from_playlist(@song2)
    assert_equal(1, @playlist.length)
  end

  def test_add_guest_to_occupants
    @room.add_guest_to_occupants(@guest2)
    assert_equal(2, @occupants.length)
  end

  def test_remove_guest_from_rooms
    @room.add_guest_to_occupants(@guest2)
    @room.add_guest_to_occupants(@guest3)
    @room.remove_guest_from_rooms(@guest2)
    @room.remove_guest_from_rooms(@guest3)
    assert_equal(1, @occupants.length)
  end

end
