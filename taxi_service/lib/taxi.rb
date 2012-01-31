class Taxi
  def initialize(normal, special)
    @normal = normal
    @special = special
  end
  
  def service(time, length)
    fee_caculator = is_special_time?(time) ? @special : @normal
    Receipt.new @ext_fee, time, length, fee_caculator.caculate(length)
  end  
  
  def is_special_time? time
    time.split(":")[0].to_i >=22 || time.split(":")[0].to_i < 6
  end
end