require("minitest/autorun")
require("minitest/rg")
require_relative("../guest")


class GuestTest < MiniTest::Test

  def setup
    @guest = Guest.new("Kirk", 200, "Something", 150)
  end

  def test_guest_has_name
    assert_equal("Kirk", @guest.name)
  end

  def test_guest_has_cash
    assert_equal(200, @guest.cash)
  end

  def test_guest_has_favourite_song
    assert_equal("Something", @guest.favourite_song)
  end

  def test_guest_has_tab
    assert_equal(150, @guest.tab)
  end

  def test_increase_guest_tab
    assert_equal(175, @guest.increase_guest_tab(25))
  end

end
