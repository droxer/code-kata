class Frame

  def initialize(rolls)
    @rolls = rolls
  end
  
  def first_roll
    @rolls[0]
  end
  
  def second_roll
    @rolls[1]
  end
  
  def is_spare?
    (first_roll + second_roll) == 10
  end
  
  def is_strike?
    first_roll == 10
  end
  
  def score
    return first_roll + second_roll + @rolls[2] if @rolls.size == 3
    first_roll + second_roll
  end
end