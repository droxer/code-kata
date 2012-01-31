require 'fizz_buzz'

describe "FizzBuzz" do
  
  context "FizzBuzz is created with several specifications" do
     
    before do
      @spec1 = double("spec1")
      @spec2 = double("spec2")
      @fizz_buzz = FizzBuzz.new([@spec1, @spec2])
    end  
   
    it "should return the input if none of the specifications match" do      
      @spec1.should_receive(:match).with(3).and_return(nil)
      @spec2.should_receive(:match).with(3).and_return(nil)
      @fizz_buzz.process(3).should eql(3)
    end
    
    it "should return the result of a match from one of the specifications" do      
      @spec1.should_receive(:match).with(3).and_return("foo")
      @spec2.should_receive(:match).with(3).and_return(nil)
      @fizz_buzz.process(3).should eql("foo")
      
      @spec1.should_receive(:match).with(3).and_return(nil)
      @spec2.should_receive(:match).with(3).and_return("bar")
      @fizz_buzz.process(3).should eql("bar")
    end  
    
    it "should concatenate matches if multiple specifications match" do      
      @spec1.should_receive(:match).with(3).and_return("foo")
      @spec2.should_receive(:match).with(3).and_return("bar")
      @fizz_buzz.process(3).should eql("foobar")
    end
    
    
  end
end
