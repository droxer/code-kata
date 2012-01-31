require 'criteria'

describe "Criteria" do
  
  context "created with a match string and a number" do
  
    before do
      @criteria = Criteria.new("fizz", 3) 
    end  

    it "should not match if input is not a multiple of 3" do
      @criteria.match(1).should be(nil)
      @criteria.match(2).should be(nil)
      @criteria.match(4).should be(nil)
    end
  
    it "should return match string if input is a multiple of the number" do
      @criteria.match(3).should eql("fizz")
      @criteria.match(6).should eql("fizz")
      @criteria.match(15).should eql("fizz")
    end
  
    it "should return match string if inputs digits add to multiple of the number" do
      @criteria.match(111).should eql("fizz")
      @criteria.match(81).should eql("fizz")
    end
  
 end
  
end