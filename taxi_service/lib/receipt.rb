class Receipt
  attr_reader :total
  
  def initialize(ext_fee, time, length, total)
    @ext_fee = ext_fee
    @time = time
    @length = length
    @total = total
  end
end