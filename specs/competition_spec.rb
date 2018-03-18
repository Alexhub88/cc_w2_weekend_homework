require("minitest/autorun")
require("minitest/rg")
require_relative("../competition")
require_relative("../guest")


class CompetitionTest < MiniTest::Test

  def setup
    @guest1 = Guest.new("Kirk", 80, "Ruby Tuesday", 0, true)
    @guest2 = Guest.new("Picard", 50, "Jumpin' Jack Flash", 49, false)
    @guest3 = Guest.new("Archer", 70, "Paint It Black", 0, true)
    @occupants = [@guest1, @guest2, @guest3]
    @competition = Competition.new(@occupants)
  end

  def test_create_competitor_list
    @competition.create_competitor_list
    assert_equal([@guest1, @guest3],@competition.competitors)
  end

  def test_sing_favourite_songs
    @competition.create_competitor_list
    @competition.sing_favourite_songs(@competition.competitors)
  end

  def test_judges_score_performances
    @competition.create_competitor_list
    @competition.judges_score_performances(@competition.competitors)
    @competition.competitors.each do |competitor|
      p "Competitor #{competitor.name} scored #{competitor.points} points!"
    end
  end

  def test_judges_declare_winner
    @competition.create_competitor_list
    @competition.judges_score_performances(@competition.competitors)
    winner = @competition.judges_declare_winner(@competition.competitors)
    p "Competitor #{winner.name} is the winner with #{winner.points} points!"
  end

end
