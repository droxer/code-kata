require 'delegate'

class TrainInfo < DelegateClass(Array)
  
  attr_reader :length, :records
  
  def initialize(info)
    tables = HtmlParser.locate_specific_table info
    trs = HtmlParser.extract_tr(tables[0][0])
    @length = trs.length
    @records = []
    trs.each do |tr|
      tds = HtmlParser.extract_td(tr[0])
      record = {
        "number" => HtmlParser.extract_content_from_td(tds[0][0]),
        "start" => HtmlParser.extract_content_from_td(tds[4][0]),
        "end" => HtmlParser.extract_content_from_td(tds[9][0])
      }

      price =  HtmlParser.extract_content_from_td(tds[12][0]).split('<br>')[0].split(':')[1]
      price.delete!("元")
      record['hard'] = price.split("/")[0]
      record['soft'] = price.split("/")[1]
      record['bed'] = price.split("/")[2]
      @records << record
    end
    super(records)
  end
end