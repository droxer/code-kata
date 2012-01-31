class PrimierFactor
  def generate(number)
    return [] if number == 1
    result = []
    divide(number, result)
    result
  end
  
  private
  
  def divide(number, result)
    factors.each do |factor|
      if is_primier? number, factor
        result << factor
        return divide(number / factor, result)
      end
    end
    
    result << number
  end
  
  def is_primier?(number, factor)
    (number % factor == 0) and (number != factor) 
  end
  
  def factors
    [2, 3]
  end
end