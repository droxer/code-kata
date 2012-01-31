require 'date'

class Receipt
  def initialize(member)
    @member = member
    @list = Hash.new
  end
  
  def add(book, days)
    @list[book] = days
  end
  
  def total
    caculate
  end
  
  def to_s
    output = ""
    @list.each do |list|
      output << "#{list[0].name} #{Time.now.year}-#{Time.now.month}-#{Time.now.day} #{list[1]}\n"
    end
    output << "Total: #{total} RMB\n" 
    output
  end
  
  private 
  def caculate
    total = 0
    @list.each_pair do |book, days|
      if (book.date + 30 ) >= Date.new(Time.now.year, Time.now.month, Time.now.day)
        total += 3 * days
      else
        total += 2 * days
      end
    end
    
    return total *= 0.80  if @member.expense >= 500
    return total *= 0.90  if @member.expense >= 300
    return total *= 0.95  if @member.expense >= 100
    total
  end
end
