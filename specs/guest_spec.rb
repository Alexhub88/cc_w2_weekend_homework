require("minitest/autorun")
require("minitest/rg")
require_relative("../guest")


class GuestTest < MiniTest::Test

  def setup
    @guest = Guest.new("Kirk", 100, "Something")
  end

  def test_guest_has_name
    assert_equal("Kirk", @guest.name)
  end

  def test_guest_has_cash
    assert_equal(100, @guest.cash)
  end

  def test_guest_has_favourite_song
    assert_equal("Something", @guest.favourite_song)
  end

  def test_favourite_song_on_playlist
    assert_equal(false, @guest.favourite_song)
  end

end
