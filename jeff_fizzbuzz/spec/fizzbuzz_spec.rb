require 'game'

describe Fixnum do
  describe :fizzbuzz do
    it "counts same number when input is 'normal'" do
      1.fizzbuzz.should == 1
      2.fizzbuzz.should == 2
    end
    
    it "shouts 'fizz' when input is times of 3" do
      3.fizzbuzz.should == 'fizz'
    end

    it "shouts 'fizz' when input includes 3" do
      13.fizzbuzz.should == 'fizz'
    end
    
    it "shouts 'buzz' when encounters 5" do
      5.fizzbuzz.should == 'buzz'
      52.fizzbuzz.should == 'buzz'
    end
    
    it "shouts 'buzz' when digit sum multiplies 5" do
      14.fizzbuzz.should == 'buzz'
    end
    
    it "shouts 'fizzbuzz' when encounters both 3 and 5" do
      35.fizzbuzz.should == 'fizzbuzz'
    end
  end
end