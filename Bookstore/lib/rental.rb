class Rental
  attr_reader :receipt
  
  def initialize(member)
    @member = member
    @receipt = Receipt.new @member
  end
  
  def add(book, days)
    @receipt.add(book, days)
  end
  
  def total
    @receipt.total
  end
  
  def print(output)
    output.puts @receipt.to_s
    @member.rentals << self
  end
end