require 'spec_helper'

describe "Taxi Service" do
  context "Xi'an" do
    before(:each) do
      normal =  FeeCaculator.new(7, 2, 1.5)
      special = FeeCaculator.new(8, 2, 2)
      @taxi = Taxi.new(normal, special)
    end
    
    it "should return service " do
      @taxi.service("10:00", 1).total.should ==7
      @taxi.service("10:00", 2).total.should ==7
      @taxi.service("10:00", 3).total.should ==8.5
    end

    it "should return specific service between 22:00 ~ 6:00" do
      @taxi.service("22:00", 2).total.should ==8
      @taxi.service("5:59", 2).total.should ==8
      @taxi.service("5:59", 3).total.should ==10
    end
  end
  
  context "Chang an" do
    before(:each) do
      normal =  FeeCaculator.new(6, 3, 2)
      special = FeeCaculator.new(7, 3, 2.5)
      @taxi = Taxi.new(normal, special)
    end
    
    it "should return service " do
      @taxi.service("10:00", 1).total.should ==6
      @taxi.service("10:00", 2).total.should ==6
      @taxi.service("10:00", 5).total.should ==10
    end

    it "should return specific service between 22:00 ~ 6:00" do
      @taxi.service("22:00", 2).total.should ==7
      @taxi.service("5:59", 2).total.should ==7
      @taxi.service("5:59", 4).total.should ==9.5
    end
  end
end