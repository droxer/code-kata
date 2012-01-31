class CoffeeStore
  def coffee(coffee)
    Coffee.new(coffee)
  end
  
end

class Coffee
  
  def initialize(name)
    @name = name
    @coffee = {"HouseBlood" => 0.89,"DarkRoast" => 0.99,"Decaf" =>1.05}
    @sources_price = {"milk" => 0.10,"mocha" => 0.20,"soy" => 0.15,"whip" => 0.12}
    @sources = {}
  end
  
  def add_source(sources)
    sources.each do |source|
      unless @sources.has_key? source
        @sources[source] = 1 
      else
        @sources[source] += 1 
      end
    end
  end
  
  def total
    @sources.inject(@coffee[@name]) { |init, value| init += @sources_price[value[0]] * value[1]}
  end
  
  def to_s
    @sources.inject("#{@name }"){|init, item| init << " #{item[1]} #{item[0]}"}  << " total #{total}"
  end
  
end



