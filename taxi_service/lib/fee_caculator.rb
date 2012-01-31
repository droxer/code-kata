class FeeCaculator
  
  def initialize(basic_price, basic_distance, unit_price)
    @basic_price = basic_price
    @basic_distance = basic_distance
    @unit_price = unit_price
  end
  
  def caculate(distance)
    if distance > @basic_distance
      (distance - @basic_distance) * @unit_price + @basic_price
    else
      @basic_price
    end
  end
end