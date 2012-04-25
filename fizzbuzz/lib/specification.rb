# encoding: utf-8

class Specification
  attr_reader :representation
  
  def initialize(criteria, representation)
    @criteria = criteria
    @representation = representation
  end
  
  def satisfy?(target)
    exactly_divide?(target) or include?(target) or specfic_divide?(target)
  end
  
  private 
    def exactly_divide?(target)
      target % @criteria == 0 
    end
    
    def specfic_divide?(target)
      target.to_s.chars.inject(0) { |init, n| init += n.to_i } % @criteria == 0  
    end
    
    def include?(target)
      target.to_s.include? @criteria.to_s
    end
end
