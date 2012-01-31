class Criteria
  def initialize(match, number)
    @match = match
    @number = number
  end
  
  def match(target)
    return @match if target % @number == 0
    return @match if target.to_s.chars.inject(0){|value,char| value + char.to_i}  % @number == 0
    nil
  end
end