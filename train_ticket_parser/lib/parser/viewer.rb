class Viewer
  def initialize(output)
    @output = output
  end
  def table(infos)
    result = "车次\t出发时间\t到达时间\t硬座票价\t硬卧票价\t软卧票价\n"
    infos.each do |info|
      result << info['number'] << "\t"
      result << info['start'] << "\t"
      result << info['end'] << "\t"
      result << info['hard'] << "\t"
      result << info['soft'] << "\t"
      result << info['bed'] << "\n"
    end
    @output.puts result
  end
end