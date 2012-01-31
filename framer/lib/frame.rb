class Frame

  def decorate(args)
    target = args.to_a
    ret = []
    target.each do |ar|
      ret << "|#{ar.ljust(target.max_length)}|" if ar.length > 0
    end
    decorate_line(ret, target.max_length)
  end
  
  private   
    def decorate_line(target, length)
      line = "+" + "-" *length + "+"
      target.unshift(line) << line
    end
end