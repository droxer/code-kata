class AirportCoffeeStore
  def coffee(coffee)
    AirportCoffee.new(coffee)
  end
end


class AirportCoffee < Coffee
  def initialize(name)
    super
    @coffee["expresso"] = 1.99
  end
  
  def total
    return @coffee[@name]  if @name == "expresso"
    super
  end
end