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
    @song4 = Song.new("Yes I'm Changing", "Tame Impala")
    @playlist = [@song1, @song2]

    @guest1 = Guest.new("Kirk", 80, "Albatross", 20)
    @guest2 = Guest.new("Picard", 50, "Everywhere", 25)
    @guest3 = Guest.new("Archer", 70, "Paint It Black", 30)
    @guest4 = Guest.new("Janeway", 200, "Airbag", 35)
    @guest5 = Guest.new("Pike", 130, "Tubular Bells", 100)
    @guest6 = Guest.new("Riker", 200, "Everywhere", 0)
    @guest7 = Guest.new("Spock", 40, "Live To Tell", 0)
    @occupants = [@guest1, @guest2]

    @guests_to_add_array1 = [@guest3, @guest4]
    @guests_to_add_array2 = [@guest3, @guest4, @guest5]

    @room = Room.new(8, 4, 100, @occupants, @playlist)

  end

  def test_room_has_name
    assert_equal(8, @room.name)
  end

  def test_number_of_occupants
    assert_equal(2, @occupants.length)
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
    @room.add_guest_to_occupants(@guest4)
    assert_equal(3, @occupants.length)
  end

  def test_remove_guest_from_rooms
    @room.remove_guest_from_rooms(@guest2)
    assert_equal(1, @occupants.length)
  end

  def test_add_multiple_guests__sufficient_space
    @room.add_multiple_guests(@guests_to_add_array1)
    assert_equal(4, @occupants.length)
  end

  def test_add_multiple_guests__insufficient_space
    @room.add_multiple_guests(@guests_to_add_array2)
    assert_equal(2, @occupants.length)
  end

  def test_guest_can_afford_entry_fee__false
    assert_equal(false, @room.guest_can_afford_entry_fee(@guest1))
  end

  def test_guest_can_afford_entry_fee__true
    assert_equal(true, @room.guest_can_afford_entry_fee(@guest4))
  end

  def test_if_guest_favourite_song_on_playlist__false
    playlist = @playlist
    assert_equal(false, @room.guest_favourite_song_on_playlist(@guest1, playlist))
  end

  def test_if_guest_favourite_song_on_playlist__true
    playlist = @playlist
    assert_equal(true, @room.guest_favourite_song_on_playlist(@guest3, playlist))
  end

  def test_guest_can_afford_entry_fee__false
    assert_equal(false, @room.guest_can_afford_entry_fee(@guest1))
  end

  def test_guest_can_afford_entry_fee__false
    assert_equal(false, @room.guest_can_afford_entry_fee(@guest1))
  end

  def test_initial_guest_tab
    assert_equal(0, @guest6.tab)
  end

  def test_start_guest_tab__succeeds
    assert_equal(true, @room.start_guest_tab(@guest6))
    assert_equal(100, @guest6.tab)
  end

  def test_start_guest_tab__fails
    assert_equal(false, @room.start_guest_tab(@guest7))
    assert_equal(0, @guest7.tab)
  end

end
