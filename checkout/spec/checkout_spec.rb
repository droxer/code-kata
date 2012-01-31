require 'spec_helper'

describe Checkout do
  
  context "Specical Rules" do
    before(:each) do
      @co = Checkout.new
    end
    
    it "should works for rule A" do
      @co.rules['A'].call(2).should ==100
      @co.rules['A'].call(3).should ==130
      @co.rules['A'].call(4).should ==180
      @co.rules['A'].call(5).should ==230
      @co.rules['A'].call(6).should ==260
    end

    it "should works for rule B" do
      @co.rules['B'].call(2).should ==45
      @co.rules['B'].call(3).should ==75
      @co.rules['B'].call(4).should ==90
      @co.rules['B'].call(5).should ==120
      @co.rules['B'].call(6).should ==135
    end
    
    it "should works for rule C & D" do
      @co.rules['C'].call(1).should ==60
      @co.rules['C'].call(2).should ==120
      @co.rules['D'].call(1).should ==70
      @co.rules['D'].call(2).should ==140
    end
    
    it "should works for rule E" do
      @co.rules['E'].call(3).should ==200
      @co.rules['E'].call(4).should ==300
      @co.rules['E'].call(5).should ==400
      @co.rules['E'].call(6).should ==400
    end
  end
  
  it "should get the count for individual product" do
    co = Checkout.new
    co.scan('AAAAA').products['A'].should ==5
    co.scan('BBB').products['B'].should ==3
    
    receipt = co.scan('AACBBCEEE')
    receipt.products['A'].should == 2
    receipt.products['B'].should == 2
    receipt.products['C'].should == 2    
    receipt.products['E'].should == 3        
  end
  
  it "should have total correctly" do
    co = Checkout.new
    co.scan('AABBAAA').total.should ==275
    co.scan('AACBBCEEE').total.should == 100 + 45 + 120 + 200
  end
end