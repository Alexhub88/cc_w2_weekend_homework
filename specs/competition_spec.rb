require("minitest/autorun")
require("minitest/rg")
require_relative("../competition")
require_relative("../guest")
require("pry")

class CompetitionTest < MiniTest::Test

  def setup

    @guest1 = Guest.new("Kirk", 80, "Albatross", 20, true)
    @guest2 = Guest.new("Picard", 50, "Everywhere", 25, false)
    @guest3 = Guest.new("Archer", 70, "Paint It Black", 30, true)
    @guest4 = Guest.new("Janeway", 200, "Airbag", 35, false)
    @guest5 = Guest.new("Pike", 130, "Tubular Bells", 100, true)
    @guest6 = Guest.new("Riker", 200, "Everywhere", 0, true)
    @guest7 = Guest.new("Spock", 40, "Live To Tell", 0, false)
    @occupants = [@guest1, @guest2, @guest3, @guest4, @guest5, @guest6, @guest7]

    @competition = Competition.new(@occupants)

  end

    p @competition.competitors

  @competition.create_competitor_list()

  p @competition.competitors

end
