class Checkout
  attr_reader :rules
  
  def initialize
    @rules = Hash.new
    @rules['A'] = lambda do |count|
      count / 3 * 130 + count % 3 * 50
    end
    @rules['B'] = lambda do |count|
      count / 2 * 45 + count % 2 * 30
    end
    
    @rules['C'] = lambda { |count| 60 * count }
    @rules['D'] = lambda { |count| 70 * count }
    
    @rules['E'] = lambda do |count|
      count / 3 * 200 + count % 3 * 100
    end
  end
  
  def scan(products)
    receipt = Receipt.new
    
    products.each_char do |char|
      unless receipt.products.include? char
        receipt.products[char] = 1 
      else
        receipt.products[char] += 1
      end
    end
    receipt.products.each do |key, value|
      receipt.total += @rules[key].call(value)
    end
    
    receipt
  end
end


