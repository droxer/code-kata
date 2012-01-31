require 'spec_helper'

describe PrimierFactor do
  let(:primier_factor) { PrimierFactor.new }

  it "should return [] given input 1" do
    primier_factor.generate(1).should ==[]
  end
  
  it "should return [2] given input 2" do
    primier_factor.generate(2).should ==[2]
  end
  
  it "should return [3] given input 3" do
    primier_factor.generate(3).should ==[3]
  end
  
  it "should return [2, 2] given input 4" do
    primier_factor.generate(4).should ==[2, 2]
  end
  
  it "should return [2, 2, 2] given input 8" do
    primier_factor.generate(8).should ==[2, 2, 2]
  end
  
  it "should return [3, 3] given input 27" do
    primier_factor.generate(27).should ==[3, 3, 3]
  end
end