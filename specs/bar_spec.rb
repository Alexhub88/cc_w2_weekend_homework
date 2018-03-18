require("minitest/autorun")
require("minitest/rg")
require_relative("../bar")
require_relative("../guest")


class BarTest < MiniTest::Test

  def setup
    @guest1 = Guest.new("Kirk", 80, "Albatross", 0)
    @guest2 = Guest.new("Picard", 50, "Everywhere", 49)
    @guest3 = Guest.new("Archer", 70, "Paint It Black", 0)

    @bar = Bar.new()
  end

  def test_add_drink_to_guest_tab__succeeds
    assert_equal(true, @bar.add_drink_to_guest_tab(@guest1, "Beer"))
    assert_equal(3.55, @guest1.tab)
    assert_equal(76.45, @guest1.cash)
  end

  def test_add_drink_to_guest_tab__fails
    assert_equal(false, @bar.add_drink_to_guest_tab(@guest2, "Cider"))
    assert_equal(49, @guest2.tab)
    assert_equal(50, @guest2.cash)
  end

end
