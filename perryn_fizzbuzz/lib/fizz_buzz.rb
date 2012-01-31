class FizzBuzz
  def initialize(specs = [Criteria.new("fizz",3),Criteria.new("buzz",5)])
    @specs = specs
  end
  
  def process(number)
    result = @specs.inject("") do |result, spec|
       match = spec.match(number)
       result << match if match
       result
    end
    result.empty? ? number : result
  end
end
