require 'spec_helper'

describe Double do

  it "should be return true given [Card.new('2'), Card.new('2')] " do
    Double.is_valid?([Card.new('2'), Card.new('2')]).should ==true
    Double.is_valid?([Card.new('3'), Card.new('3')]).should ==true    
  end
  
  it "should be return false given invalid cards " do
    Double.is_valid?([Card.new('3')]).should ==false
    Double.is_valid?([Card.new('3'), Card.new('3'), Card.new('3')]).should ==false
    Double.is_valid?([Card.new('3'), Card.new('2')]).should ==false
  end
  
  it "should be able compare 2 double " do
    Double.new([Card.new('3'), Card.new('3')]).should < Double.new([Card.new('2'), Card.new('2')]) 
  end
end