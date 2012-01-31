class Fizzbuzz
  def input number
    return "fizz"     if number.to_s.include?"3"
    return "buzz"     if number.to_s.include?"5"

    buzz = Repeater.new(5, "buzz").repeat number
    fiz = Repeater.new(3, "fizz").repeat number
    return fiz + buzz if (buzz != "") || (fiz != "")
    number
  end  
end

class Repeater
  def initialize thingy, words
    @base = thingy
    @words = words
  end
  def repeat number
    result = @words  if eval("is_x_number(in_total_of(#{number}))") || eval("is_x_number(#{number})")
    result ? result : ""
  end
  
  def in_total_of number
    digits = number.to_s.chars
    result = 0
    digits.each do |digit|
      result += digit.to_i
    end
    result    
  end
  
  def is_x_number number
    number % @base == 0
  end
end
