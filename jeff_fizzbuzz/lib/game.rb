class Fixnum
  def fizzbuzz
    @message = ""
    @message << 'fizz' if encounter(3)
    @message << 'buzz' if encounter(5)
    @message = 'buzz' if digits_sum_multiplies(5)
    @message.empty? ? self : @message
  end
  
  def encounter(digit)
    self % digit ==0 || (to_s.include? digit.to_s)
  end

  def digits_sum_multiplies(digit)
    to_s.chars.inject(0) {|memo, item| memo += item.to_i } % digit == 0
  end
end