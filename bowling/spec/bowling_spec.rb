require 'spec_helper'

describe Bowling do
  
  context "with missing round" do
    it "#accumulate score" do
      bowling = Bowling.new
      bowling.roll(Frame.new([1,2]))
      bowling.roll(Frame.new([2,3]))
      bowling.score.should ==8 
    end
  end
  
  context "with bowling spares " do
    it "#accumulate score depends first roll of next round" do
      bowling = Bowling.new
      bowling.roll(Frame.new([5,5]))
      bowling.roll(Frame.new([2,3]))
      bowling.score.should ==17
    end
  end
  
  context "with bowling strike" do
    it "#accumulate score depends next round" do
      bowling = Bowling.new
      bowling.roll(Frame.new([10,0]))
      bowling.roll(Frame.new([2,3]))
      bowling.score.should ==20
    end   
  end
  
  context "when final round" do
    it "#last roll is missing" do
      bowling = Bowling.new
      bowling.roll(Frame.new([2,3]))
      bowling.roll(Frame.new([2,3]))
      bowling.roll(Frame.new([2,3]))
      bowling.roll(Frame.new([2,3]))
      bowling.roll(Frame.new([2,3]))            
      bowling.roll(Frame.new([2,3]))
      bowling.roll(Frame.new([2,3]))
      bowling.roll(Frame.new([2,3]))
      bowling.roll(Frame.new([2,3]))
      bowling.roll(Frame.new([10,2,10]))
      bowling.score.should == 67
    end
    
    it "#last roll is spare" do
      bowling = Bowling.new
      bowling.roll(Frame.new([2,3]))
      bowling.roll(Frame.new([2,3]))
      bowling.roll(Frame.new([2,3]))
      bowling.roll(Frame.new([2,3]))
      bowling.roll(Frame.new([2,3]))            
      bowling.roll(Frame.new([2,3]))
      bowling.roll(Frame.new([2,3]))
      bowling.roll(Frame.new([2,3]))
      bowling.roll(Frame.new([5,5]))
      bowling.roll(Frame.new([5,5,10]))
      bowling.score.should == 75
    end
    
    it "#last roll is spare" do
      bowling = Bowling.new
      bowling.roll(Frame.new([2,3]))
      bowling.roll(Frame.new([2,3]))
      bowling.roll(Frame.new([2,3]))
      bowling.roll(Frame.new([2,3]))
      bowling.roll(Frame.new([2,3]))            
      bowling.roll(Frame.new([2,3]))
      bowling.roll(Frame.new([2,3]))
      bowling.roll(Frame.new([2,3]))
      bowling.roll(Frame.new([5,5]))
      bowling.roll(Frame.new([2,3,0]))
      bowling.score.should == 57
    end

    it "#last roll is strike" do
      bowling = Bowling.new
      bowling.roll(Frame.new([2,3]))
      bowling.roll(Frame.new([2,3]))
      bowling.roll(Frame.new([2,3]))
      bowling.roll(Frame.new([2,3]))
      bowling.roll(Frame.new([2,3]))            
      bowling.roll(Frame.new([2,3]))
      bowling.roll(Frame.new([2,3]))
      bowling.roll(Frame.new([2,3]))
      bowling.roll(Frame.new([10,0]))
      bowling.roll(Frame.new([5,5,10]))
      bowling.score.should == 90
    end
  end
  
  it "should return 230 for all strike" do
    bowling = Bowling.new
    bowling.roll(Frame.new([10,0]))
    bowling.roll(Frame.new([10,0]))
    bowling.roll(Frame.new([10,0]))
    bowling.roll(Frame.new([10,0]))
    bowling.roll(Frame.new([10,0]))
    bowling.roll(Frame.new([10,0]))
    bowling.roll(Frame.new([10,0]))
    bowling.roll(Frame.new([10,0]))
    bowling.roll(Frame.new([10,0]))        
    bowling.roll(Frame.new([10, 10, 10]))
    bowling.score.should == 230
  end
end