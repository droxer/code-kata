class Book
  attr_reader :name
  attr_reader :date
  
  def initialize(name, buy_date)
    @name = name
    @date = buy_date
  end
end