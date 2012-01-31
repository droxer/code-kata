class Array
  def deep_clone
    Marshal.load( Marshal.dump(self) )
  end
end