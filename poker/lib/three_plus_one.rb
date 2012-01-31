class ThreePlusOne
  include Comparable
  attr_reader :cards

  class << self
    def is_valid?(cards)   
      cards.size == 4 && cards.sort()[1] == cards.sort()[2]
    end
  end

  def initialize(cards)
    @cards = cards
  end

  def <=>(others)
    @cards.sort[2] <=> others.cards.sort[2]
  end
end