require 'spec_helper'

describe ThreePlusOne do

  it "should be return true given [Card.new('2'), Card.new('2')] " do
    ThreePlusOne.is_valid?([Card.new('2'), Card.new('2'), Card.new('2'), Card.new('1')]).should ==true
    ThreePlusOne.is_valid?([Card.new('3'), Card.new('2'), Card.new('2'), Card.new('2')]).should ==true    
    ThreePlusOne.is_valid?([Card.new('2'), Card.new('3'), Card.new('2'), Card.new('2')]).should ==true        
  end
  
  it "should be return false given invalid cards " do
    ThreePlusOne.is_valid?([Card.new('3')]).should ==false
    ThreePlusOne.is_valid?([Card.new('3'), Card.new('3'), Card.new('2')]).should ==false
    ThreePlusOne.is_valid?([Card.new('3'), Card.new('3')]).should ==false
    ThreePlusOne.is_valid?([Card.new('2'), Card.new('1'), Card.new('2'), Card.new('1')]).should ==false    
  end
  
  it "should be able compare trible " do
    ThreePlusOne.new([Card.new('3'), Card.new('3'), Card.new('3'), Card.new('2')]).should < ThreePlusOne.new([Card.new('4'), Card.new('4'), Card.new('4'), Card.new('3')]) 
    ThreePlusOne.new([Card.new('3'), Card.new('2'), Card.new('3'), Card.new('3')]).should < ThreePlusOne.new([Card.new('3'), Card.new('4'), Card.new('4'), Card.new('4')]) 
  end
end