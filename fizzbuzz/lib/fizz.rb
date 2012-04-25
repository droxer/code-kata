# encoding: utf-8

class Fizz
  def initialize
    @specs = [Specification.new(3, 'fizz'), Specification.new(5, 'buzz')]   
  end
  
  def sound(numbers)
    numbers.inject("") {|memo, number| memo << handle(number)} 
  end
  
  private 
    def handle(number)
      return number.to_s if @specs.all? {|spec| not spec.satisfy?(number)}
      @specs.inject("") { |memo, spec| memo << spec.representation if spec.satisfy? number; memo }
    end
end
