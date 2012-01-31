require "spec_helper"

describe Card do
  it "should compare the single card" do

    Card.new('2').should > Card.new('3')
    Card.new('1').should_not > Card.new('2')

    Card.new('J').should > Card.new('10')
    Card.new('Q').should > Card.new('J')
    Card.new('1').should > Card.new('K')
  end
end
