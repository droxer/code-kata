require 'spec_helper'

describe Trible do

  it "should be return true given [Card.new('2'), Card.new('2'), Card.new('2')] " do
    Trible.is_valid?([Card.new('2'), Card.new('2'), Card.new('2')]).should ==true
    Trible.is_valid?([Card.new('3'), Card.new('3'), Card.new('3')]).should ==true    
  end
  
  it "should be return false given invalid cards " do
    Trible.is_valid?([Card.new('3')]).should ==false
    Trible.is_valid?([Card.new('3'), Card.new('3'), Card.new('2')]).should ==false
    Trible.is_valid?([Card.new('3'), Card.new('3')]).should ==false
  end
  
  it "should be able compare trible " do
    Double.new([Card.new('3'), Card.new('3'), Card.new('3')]).should < Double.new([Card.new('2'), Card.new('2'), Card.new('2')]) 
  end
end