require 'spec_helper'
require 'date'

describe Rental do
  let(:rental) { Rental.new(Member.new("10001"))}
  let(:new_date) { Date.new(2011, 11, 1)}
  let(:old_date) { Date.new(2010, 10, 2)}
  
  it "should return total given new book and rental days" do
    rental.add(Book.new("JAVA", new_date), 2)
    rental.total.should ==6
  end
  
  it "should return total given old book and rental days" do
    rental.add(Book.new("JAVA", old_date), 2)
    rental.total.should ==4
  end
  
  it "should return total given both old books & new books and rental days" do
    rental.add(Book.new("JAVA", old_date), 2)
    rental.add(Book.new("JAVA", new_date), 2)
    rental.total.should ==10
  end
  
  it "should ouput receipt" do
    rental.add(Book.new("JAVA", old_date), 2)
    rental.add(Book.new("Ruby", new_date), 2)
    receipt =<<-EOF 
JAVA #{Time.now.year}-#{Time.now.month}-#{Time.now.day} 2
Ruby #{Time.now.year}-#{Time.now.month}-#{Time.now.day} 2
Total: 10 RMB
    EOF
    output = double(:output)
    output.should_receive(:puts).with(receipt)
    rental.print(output)
  end
end