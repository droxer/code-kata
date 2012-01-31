class Bowling
  attr_reader :score
  
  def initialize
    @score = 0
    @frames = []
  end
  
  def roll(frame)
    if @frames.size >= 1 && @frames.last.is_strike?
      @score += frame.score * 2
    elsif @frames.size >= 1 && @frames.last.is_spare?
      @score += frame.score + frame.first_roll  
    else
      @score += frame.score
    end  
    @frames << frame
  end
end