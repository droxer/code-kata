require 'spec_helper'

describe BookStore do
  let(:book_store) {BookStore.new}
  
  it "should be able create rental" do
    member = Member.new("10001")
    book_store.new_rental(member).class.name.should =='Rental'    
  end
  
  context "With discount" do
    let(:stub_rental) { double(:rental)}
    let (:book) {Book.new("The Ruby Way", Date.new(2011,11,2))}
    
    it "should discount 5% for member that has consume more that 100" do
      member = Member.new("10001")
      member.stub(:expense).and_return(100)

      rental = book_store.new_rental(member)
      rental.add(book, 10)
      rental.total.should == 30 * 0.95
    end

    it "should discount 10% for member that has consume more that 300" do
      member = Member.new("10001")
      member.stub(:expense).and_return(300)

      rental = book_store.new_rental(member)
      rental.add(book, 10)
      rental.total.should == 30 * 0.90
    end

    it "should discount 20% for member that has consume more that 500" do
      member = Member.new("10001")
      member.stub(:expense).and_return(500)

      rental = book_store.new_rental(member)
      rental.add(book, 10)
      rental.total.should == 30 * 0.80
    end
  end
end