require_relative './spec_helper'
require_relative '../lib/player'
require_relative '../lib/tilebag'

describe Player do
  before do
    @sarah = Player.new("sarah")
    @lisa = Player.new("lisa")
  end

  it "is an object we have access to" do
    Player.wont_be_nil
  end

  describe "Player#name" do
    it "returns sarah when initialized with sarah" do
      @sarah.name.must_equal "sarah"
    end
  end

  describe "words played by player" do
      ABOVE_100 = %w[quiz array scores lizard jokes lemon class stack cherry]
      WORDS_PLAYED = %w[cat dog zebra elephant bird cow snake puma]

    before do
      WORDS_PLAYED.each do |word|
        @sarah.play(word)
      end

      ABOVE_100.each do |word|
        @lisa.play(word)
      end
    end


    it "returns the score of the word for the play(word) method" do
      @sarah.play("cat").must_equal 5
    end

    it "returns an array of words gussed for the plays method" do
      @sarah.plays.must_equal WORDS_PLAYED
    end

    it "returns array of words equal to ABOVE_100 for the plays method" do
      @lisa.plays.must_equal ABOVE_100
    end

    it "returns the total score of all words played for the total_score method" do
      @sarah.total_score.must_equal 71
    end

    it "returns false if the player has under 100 points for the won? method" do
      @sarah.won?.must_equal false
    end

    it "it will return true if the player has over 100 points for the won? method" do
      @lisa.won?.must_equal true
    end

    it "will return false if the player has already won for the play word method" do
      @lisa.play("cat").must_equal false
    end

    it "will return the highest scoring word from all words played using the highest_scoring_word method" do
      @lisa.highest_scoring_word.must_equal "quiz"
    end

    it "will return the score of the highest word in the list using the highest_word_score method" do
      @lisa.highest_word_score.must_equal 22
    end


    it "will return an empty array" do
      @sarah.tiles.must_equal []
    end

    it "will return an array using the draw tile method" do
      tile_bag = TileBag.new
      @sarah.draw_tiles(tile_bag).must_be_instance_of Array
    end

    it "will return an array of length 7" do
      tile_bag = TileBag.new
      @sarah.draw_tiles(tile_bag).length.must_equal 7
    end

  end
end
