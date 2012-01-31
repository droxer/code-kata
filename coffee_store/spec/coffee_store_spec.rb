require 'spec_helper'

describe CoffeeStore do
  it "should return coffee given coffee name" do
    coffee_store = CoffeeStore.new
    coffee_store.coffee("HouseBlood").total.should ==0.89
    coffee_store.coffee("DarkRoast").total.should ==0.99    
    coffee_store.coffee("Decaf").total.should ==1.05    
  end
  
  it "should return receipts given coffee name & sources" do
    coffee_store = CoffeeStore.new
    coffee = coffee_store.coffee("HouseBlood")
    coffee.add_source(["milk", "milk"])
    coffee.total.should == 0.89 + 0.10 *2
  end
  
  it "should print receipts given coffee name & sources" do
    coffee_store = CoffeeStore.new
    coffee = coffee_store.coffee("HouseBlood")
    coffee.add_source(["milk", "mocha"])
    coffee.to_s.should =="HouseBlood 1 milk 1 mocha total #{0.89 + 0.10 + 0.20}"
  end
  
  it "should return receipts given coffee name & sources for airport" do
    coffee_store = AirportCoffeeStore.new
    coffee = coffee_store.coffee("expresso")
    coffee.add_source(["milk", "mocha"])
    coffee.total.should == 1.99
    coffee.to_s.should =="expresso 1 milk 1 mocha total #{1.99}"
  end
end