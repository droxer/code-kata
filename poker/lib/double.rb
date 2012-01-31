class Double
  include Comparable
  attr_reader :cards

  class << self
    def is_valid?(cards)
      cards.size == 2 && cards[0].point == cards[1].point
    end
  end

  def initialize(cards)
    @cards = cards
  end

  def <=>(others)
    @cards[0] <=> others.cards[0]
  end

end