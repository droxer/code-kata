class Receipt
  attr_accessor :products
  attr_accessor :total
  def initialize
    @products = Hash.new
    @total = 0
  end
end