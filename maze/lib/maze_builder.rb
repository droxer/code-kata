class MazeBuilder
  
  def initialize(data)
    @data = data
  end
  
  def build(args)
    rows = []
    args.each_index do |row|
      cols = []
      args[row].each_index { |col| cols <<  @data[args[row][col]].deep_clone } 
      rows << merge_cols(cols)
    end
    merge_rows(rows)
  end
  
  private 
  def merge_cols(cols)
    cols.inject do |c, n|
      c.each_index do |index|
        n[index].drop(1).each { |element| c[index] << element}
      end
    end
  end
  
  def merge_rows(rows)
    rows.flatten!(1)
    rows.size.times do |index|
      rows.delete_at(index) if rows.size > 4 && (index % 4 == 3 )
    end
    rows
  end
end
