require "fizzbuzz"


describe Fizzbuzz do
  it "student should report 1 given teacher said 1" do
    Fizzbuzz.new.input(1).should ==1
  end
  
  it "student should report 2 given teacher said 2" do
    Fizzbuzz.new.input(2).should == 2
  end
  
  context "student should report fizz given teacher said multiple 3" do
    it "student should report fizz given teacher said 3" do
      Fizzbuzz.new.input(3).should == "fizz"
    end
  
    it "student should report fizz given teacher said 6" do
      Fizzbuzz.new.input(6).should == "fizz"
    end
  end

  context "student should report fizz given teacher said multiple 3" do  
    it "student should report buzz given teacher said 5" do
      Fizzbuzz.new.input(5).should == "buzz"
    end
  
    it "student should report buzz given teacher said 10" do
      Fizzbuzz.new.input(10).should == "buzz"
    end
  end
  
  context "student should report fizz given teacher said multiple 3 and 5" do  
    it "student should report fizzbuzz given teacher said 15" do
      Fizzbuzz.new.input(60).should == "fizzbuzz"
    end
  end
  
  context "in total of number is thingy of 3" do    
    it "student should report fizz given teacher said 201" do
      Fizzbuzz.new.input(201).should == "fizz"
    end
  end

  context "in total of number is thingy of 5" do    
    it "student should report fizz given teacher said 201" do
      Fizzbuzz.new.input(118).should == "buzz"
    end
  end
  
  context "in total of number is thingy of 3 and 5" do      
    it "student should report fizz given teacher said 555" do
      Fizzbuzz.new.input(87).should == "fizzbuzz"
    end
  
    it "student should report fizzbuzz given teacher said 78" do
      Fizzbuzz.new.input(78).should == "fizzbuzz"
    end
  end
  
  context "should return fizz when it contains 3" do      
    it "student should report fizz given teacher said 31" do
      Fizzbuzz.new.input(31).should == "fizz"
    end
    
    it "student should report fizz given teacher said 31" do
      Fizzbuzz.new.input(32).should == "fizz"
    end
  end
  
  context "should return fizz when it contains 5" do      
    it "student should report fizz given teacher said 31" do
      Fizzbuzz.new.input(57).should == "buzz"
    end
    
  end  
end