class BookStore
  def initialize
    @members = {}
  end
  
  def new_rental(member)
    @members[member.id] = member unless @members.has_key? member.id
    Rental.new @members[member.id]
  end
end

