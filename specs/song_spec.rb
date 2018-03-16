require("minitest/autorun")
require("minitest/rg")
require_relative("../song")

class SongTest < MiniTest::Test

  def setup
    @song = Song.new("Yes I'm Changing", "Tame Impala")
  end

  def test_song_has_title
    assert_equal("Yes I'm Changing", @song.title)
  end

  def test_song_has_artist
    assert_equal("Tame Impala", @song.artist)
  end

end
