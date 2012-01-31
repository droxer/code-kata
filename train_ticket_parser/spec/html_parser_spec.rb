require 'spec_helper'

describe HtmlParser do
  
  it "should locate table which contains theads from the html" do
    original_html = <<-HTML
      <html>
        <table><thead>thead</thead>fdsafdsafdas</table>
        <table>fdsafdsafdas</table>
      </html>
    HTML
    tables = HtmlParser.locate_specific_table(original_html)
    tables.length.should ==1
    tables[0][0].should == "fdsafdsafdas"
  end
  
  it "should extract trs in table" do
    original_table = <<-HTML
     <table onclick=sortColumn(event)> 
        <thead>
          <tr>aaaa</tr>
        </thead>
        <tr>bbbb</tr>
     </table> 
    HTML
    trs = HtmlParser.extract_tr(original_table)
    trs.length.should ==2
    trs[0][0].should =="aaaa"
    trs[1][0].should =="bbbb"
  end
  
  it "should extract tds in tr" do
    original_tr = <<-HTML
    <tr align="center" bgcolor="#f1f9fe" onmouseout="this.style.background='#f1f9fe'"  onmouseover="this.style.background='#BDDFFF'">
    		<td><a href='../Search/K1363.html'>K1363</a></td>
    		<td>空调快速</td>
    		<td><a href="/Station/北京西.htm" target=_blank>北京西</a></td>
    		<td>北京西</td>
    		<td>21:52</td>
    		<td>西安</td>
    		<td><a href='http://train.tielu.org/HuoChePiao/TicketOrder.aspx?CFZ=%e5%8c%97%e4%ba%ac&DDZ=%e8%a5%bf%e5%ae%89&CFSJ=2011-09-21' target=_blank>买票</a></td>
    		<td><a href='http://piao.tielu.org/Search/不限-不限-1-QiuGou-不限.aspx' target=_blank><font color=red>转让</font></a> <a href='http://piao.tielu.org/Search/不限-不限-1-ZhuanRang-不限.aspx' target=_blank><font color=red>求购</font></a></td>
    		<td><a href='http://elong.tielu.org/list-2701-------.html' target=_blank>促销[西安]酒店</a> </td>
    		<td>12:43</td>
    		<td>成都</td>
    		<td>14小时51分钟</td>
    		<td align="left">硬座/软座/硬卧中铺 :150//265元<br>
    		软卧下/高级软卧下铺:417/417元<br>
    		二等/一等/特等软座 ://元
    		</td>
    	</tr>
    HTML
    tds = HtmlParser.extract_td(original_tr)
    tds.length.should ==13
    tds[0][0].should =="<a href='../Search/K1363.html'>K1363</a>"
    tds[4][0].should =="21:52"
    tds[9][0].should =="12:43"
  end
  
  it "should extract content from td" do
    orginal_html = <<-HTML
      <a href='http://train.tielu.org/HuoChePiao/TicketOrder.aspx?CFZ=%e5%8c%97%e4%ba%ac&DDZ=%e8%a5%bf%e5%ae%89&CFSJ=2011-09-21' target=_blank>买票</a>
    HTML
    HtmlParser.extract_content_from_td(orginal_html).should =='买票'
  end
end