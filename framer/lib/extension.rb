class String
  def to_a
    target = []
    target << self
    target.flatten
  end
end

class Array
  def max_length
    self.max_by {|arg| arg.length}.length 
  end
end