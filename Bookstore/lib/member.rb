class Member
  attr_reader :id
  attr_reader :rentals
  
  def initialize(id)
    @id = id
    @rentals = []
  end
  
  def expense
    @rentals.inject(0) {|inital, rental| inital + rental.total}
  end
end