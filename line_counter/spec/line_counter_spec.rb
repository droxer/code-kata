require "spec_helper"

describe LineCounter do
  it "should return 3 given 3 lines code without comment & blank" do
    codes =<<-CODE
    int main(){
      printf("Hello World!")
    }
    CODE
    
    line_counter = LineCounter.new()
    line_counter.count(codes).should ==3
  end
  
  context "with blank" do
    it "#return 3 given 4 lines code with 1 blank" do
      codes =<<-CODE
      int main(){
        
        printf("Hello World!")
      }
      CODE
  
      line_counter = LineCounter.new()
      line_counter.count(codes).should ==3
    end
  end
  
  context "with // style comment" do
    it "#return 2 given 3 lines code with 1 line comment" do
      codes =<<-CODE
      int main(){
        //printf("Hello World!")
      }
      CODE
  
      line_counter = LineCounter.new()
      line_counter.count(codes).should ==2
    end
  end
  
  context "with /* */ style comment" do
    it "#return 2 given 3 lines code with 1 line /* */" do
      codes =<<-CODE
      int main(){
        /*printf("Hello World!")*/
      }
      CODE
      
      line_counter = LineCounter.new()
      line_counter.count(codes).should ==2
    end
    
    it "#return 2 given 4 lines code with 2 line /* */" do
      codes =<<-CODE
      int main(){
        /*printf("Hello World!")
        printf("Hello World!")
        */
      }
      CODE
      
      line_counter = LineCounter.new()
      line_counter.count(codes).should ==2
    end
    
    it "#return 2 given 4 lines code contains */ " do
      codes =<<-CODE
      int main(){
        /*printf("Hello World!")
        printf("*/")
        */
      }
      CODE
      
      line_counter = LineCounter.new()
      line_counter.count(codes).should ==2
    end
  end
end