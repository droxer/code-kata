class LineCounter
  
  def initialize
    @comment_flag = false
  end
  
  def count codes
    codes.split("\n").inject(0) do |count, line| 
      count += (skip?(line.strip) ? 0 : 1)
    end
  end
  
  private 
  
  def skip? line
    blank?(line) or one_line_coment? (line) or multiple_line_comment?(line)
  end
  
  def blank? line
    line.empty?
  end
  
  def one_line_coment? line
    line.start_with?("//")
  end
  
  def multiple_line_comment? line

    return true if line.start_with?("/*") && line.end_with?("*/")
    if line.start_with?("/*")
      @comment_flag = true
      return true
    end
    
    if line.end_with?("*/")
      @comment_flag = false
      return true
    end    
    @comment_flag
  end
end