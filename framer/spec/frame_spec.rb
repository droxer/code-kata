require "spec_helper"

describe Frame do
  let(:frame) {Frame.new }
  
  it "should return ['++', '++'] given empty string" do
    frame.decorate("").should ==['++', 
                                     '++']
  end
  
  it "should return ['+-+', '|f|' '+-+'] given 'f'" do
    frame.decorate("f").should ==['+-+', 
                                      '|f|', 
                                      '+-+']
  end
  
  it "should return ['+---+', '|foo|', '+---+'] given 'foo'" do
    frame.decorate("foo").should ==['+---+', 
                                        '|foo|', 
                                        '+---+']
  end
  
  it "should return correctly given ['foo', 'bar']" do
    frame.decorate(["foo", "bar"]).should ==['+---+', 
                                                 '|foo|', 
                                                 '|bar|', 
                                                 '+---+']
  end
  
  it "should return correctly given ['i', 'am', 'multiple', 'strings']" do
    frame.decorate(['i', 'am', 'multiple', 'strings']).should ==['+--------+', 
                                                                 '|i       |',
                                                                 '|am      |',
                                                                 '|multiple|', 
                                                                 '|strings |', 
                                                                 '+--------+']
  end
end