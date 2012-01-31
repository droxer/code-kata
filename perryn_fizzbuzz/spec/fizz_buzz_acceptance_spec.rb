require 'fizz_buzz'

describe "FizzBuzz" do

  context "input is not a multiple of 5 or three" do
     it "should output the same as the input" do
       FizzBuzz.new.process(1).should eql(1)
       FizzBuzz.new.process(2).should eql(2)
       FizzBuzz.new.process(4).should eql(4)
     end
  end
  
  context "input is a multiple of three" do
     it "should output fizz" do
       FizzBuzz.new.process(3).should eql("fizz")
       FizzBuzz.new.process(6).should eql("fizz")
       FizzBuzz.new.process(9).should eql("fizz")
     end
  end
  
  context "input is a multiple of five but not three" do
     it "should output buzz" do
       FizzBuzz.new.process(5).should eql("buzz")
       FizzBuzz.new.process(10).should eql("buzz")
       FizzBuzz.new.process(20).should eql("buzz")
     end
  end
  
  context "input is a multiple of five and three" do
     it "should output fizzbuzz" do
       FizzBuzz.new.process(15).should eql("fizzbuzz")
       FizzBuzz.new.process(30).should eql("fizzbuzz")
       FizzBuzz.new.process(45).should eql("fizzbuzz")
     end
  end
  
  context "addition of digits in number satisfies fizz or buzz criteria" do
    it "should ouput fizzbuzz" do
       FizzBuzz.new.process(111).should eql("fizz")
       FizzBuzz.new.process(14).should eql("buzz")       
       FizzBuzz.new.process(78).should eql("fizzbuzz")
    end
  end
  
end
