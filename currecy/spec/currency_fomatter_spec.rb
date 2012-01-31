require 'spec_helper'

describe "Currency formtter" do
 context "when the input currency is less than or equal ten" do
   it "#return 0 $ given one ''" do
     currncy_formatter = CurrencyFormatter.new
     currncy_formatter.format("").should =="0 $"
   end
   
   it "#return acorrding x $ given one 'x dollar'" do
     currncy_formatter = CurrencyFormatter.new
     currncy_formatter.format("one dollar").should =="1 $"
     currncy_formatter.format("two dollar").should =="2 $"     
     currncy_formatter.format("three dollar").should =="3 $"          
     currncy_formatter.format("nine dollar").should =="9 $"               
     currncy_formatter.format("ten dollar").should =="10 $"                    
   end
 end
 
 context "when the inut is more than ten but less then one hundred" do
   it "#return acorrding x $ given one 'x dollar less than twenty'" do
     currncy_formatter = CurrencyFormatter.new
     currncy_formatter.format("twelve dollar").should =="12 $"
     currncy_formatter.format("thirteen dollar").should =="13 $"     
     currncy_formatter.format("fourteen dollar").should =="14 $"          
     currncy_formatter.format("fifteen dollar").should =="15 $"                                  
   end
   
   it "#return acorrding x $ given one x dollar more than twenty less than or equal 100" do
     currncy_formatter = CurrencyFormatter.new
     currncy_formatter.format("twenty dollar").should =="20 $"
     currncy_formatter.format("twenty one dollar").should =="21 $"                             
     currncy_formatter.format("thirty dollar").should =="30 $"                                  
     currncy_formatter.format("thirty two dollar").should =="32 $"                                       
     currncy_formatter.format("thirty dollar").should =="30 $"                                  
     currncy_formatter.format("ninety nine dollar").should =="99 $"    
     currncy_formatter.format("one hundred dollar").should =="100 $"          
   end
 end
 
 context "when the inut is more than hunderd but less then one hundred" do
   it "#return acorrding x $ given one x dollar more than 100 less than 1000" do
     currncy_formatter = CurrencyFormatter.new
     currncy_formatter.format(" one  hundred   and  one    dollar").should =="101 $"
     currncy_formatter.format("one hundred and twenty one dollar").should =="121 $"                               
   end
 end
end