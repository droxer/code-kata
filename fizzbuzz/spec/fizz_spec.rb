require 'spec_helper'

describe Fizz do
  let (:fizz) { Fizz.new }
  it "should return 'fizz' given the number can divide by 3" do
    fizz.sound([1, 2, 3]).should =="12fizz"
    fizz.sound([1,2,3,4,5,6]).should =="12fizz4buzzfizz"
  end
  
  it "should return 'buzz' given the number can divide by 5" do
    fizz.sound([1,2,3,4,5]).should =="12fizz4buzz"
    fizz.sound([1, 2, 3, 4, 5, 6]).should =="12fizz4buzzfizz"
  end  
  
  it "should return 'fizzbuzz' given the number can divide by 5 and 3" do
    fizz.sound([15]).should =="fizzbuzz"
    fizz.sound([3, 15]).should =="fizzfizzbuzz"
  end
  
  it "should return 'fizz' given number can split and plus is 3 or contains 3" do
    fizz.sound([111]).should =="fizz"
    fizz.sound([36]).should =="fizz"
  end
  
  it "should return 'buzz' given number can split and plus is 5 or contains 5" do
    fizz.sound([11111]).should =="buzz"
    fizz.sound([50]).should =="buzz"
  end
  
end