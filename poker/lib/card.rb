require 'card_comparable'

class Card
  include Comparable
  include CardComparable


  attr_reader :point

  def initialize(point)
    @point = point
  end

  def <=>(others)
    compare(self, others)
  end
  
  def inspect
    @point
  end
  
end

