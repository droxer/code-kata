require 'iconv'
require 'spec_helper'

describe TrainInfo do
  
  context "should get entry info for train info." do
    before(:all) do
      f = File.open(File.expand_path("target.html", "spec/fixtures/"))
      @info =""
      f.readlines.each do |line|
        @info << Iconv.conv("UTF-8", "GB2312", line)
      end
      f.close
    end

    it "should show count of train info" do
      train_info = TrainInfo.new @info
      train_info.length.should ==10
    end

    it "should show train number of each records" do
      train_info = TrainInfo.new @info
      train_info[0]['number'].should =='K1363'
    end

    it "should show train start time of each records" do
      train_info = TrainInfo.new @info
      train_info[0]['start'].should =='21:52'
    end

    it "should show train end time of each records" do
      train_info = TrainInfo.new @info
      train_info[0]['end'].should =='12:43'
    end

    it "should show train price for hard chair" do
      train_info = TrainInfo.new @info
      train_info[0]['hard'].should =='150'
    end

    it "should show train price for soft chair" do
      train_info = TrainInfo.new @info
      train_info[0]['soft'].should ==''
    end

    it "should show train price for soft chair" do
      train_info = TrainInfo.new @info
      train_info[0]['bed'].should =='265'
    end
  end
  
  context "display train info as specific format" do
    it "display train info as table" do
      output = stub(:output)
      view = Viewer.new output
      info = []
      info[0] = {
        "number" => "k123",
        "start" => "12:30",
        "end" => "18:00",
        "hard" => "50",
        "soft" => "100",
        "bed" => "200"
      }
      output.should_receive(:puts).with "车次\t出发时间\t到达时间\t硬座票价\t硬卧票价\t软卧票价\nk123\t12:30\t18:00\t50\t100\t200\n"
      view.table(info)
    end
  end
end