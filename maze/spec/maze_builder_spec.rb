require "spec_helper"

describe MazeBuilder do
  
  before(:each) do
    data = { 
            'x' => [['#','#','#','#'], ['#','#','#','#'], ['#','#','#','#'], ['#','#','#','#']],
             '_' => [['#','#','#','#'], ['#',' ',' ','#'], ['#',' ',' ','#'], ['#','#','#','#']]
           }

    @maze_builder = MazeBuilder.new(data)
  end
    
  it "should return [['#','#','#','#'], ['#','#','#','#'], ['#','#','#','#'], ['#','#','#','#']] given [['x']]" do
    @maze_builder.build([['x']]).should ==[
      ['#','#','#','#'], 
      ['#','#','#','#'], 
      ['#','#','#','#'], 
      ['#','#','#','#']]
  end
  
  it "should return [['#','#','#','#'], ['#',' ',' ','#'], ['#',' ',' ','#'], ['#','#','#','#']] given [['_']]" do
    @maze_builder.build([['_']]).should ==[
      ['#','#','#','#'], 
      ['#',' ',' ','#'], 
      ['#',' ',' ','#'], 
      ['#','#','#','#']]
  end
    
  it "should return according result  given [['x', 'x']]" do
    @maze_builder.build([['x', 'x']]).should ==[
      ['#','#','#','#', '#', '#', '#'], 
      ['#','#','#','#', '#', '#', '#'], 
      ['#','#','#','#', '#', '#', '#'], 
      ['#','#','#','#', '#', '#', '#']]
  end
      
  it "should return according result  given [['x'], ['x']]" do
    @maze_builder.build([['x'], ['x']]).should ==[
      ['#','#','#','#'], 
      ['#','#','#','#'], 
      ['#','#','#','#'], 
      ['#','#','#','#'], 
      ['#','#','#','#'], 
      ['#','#','#','#'], 
      ['#','#','#','#']]
  end
    
  it "should return according result  given [['x', '_']]" do
     @maze_builder.build([['x', '_']]).should ==[
       ['#','#','#','#', '#', '#', '#'], 
       ['#','#','#','#', ' ', ' ', '#'], 
       ['#','#','#','#', ' ', ' ', '#'], 
       ['#','#','#','#', '#', '#', '#']]
  end
     
  it "should return according result  given [['x'], ['_']]" do
    @maze_builder.build([['x'], ['_']]).should ==[
     ['#','#','#','#'], 
     ['#','#','#','#'], 
     ['#','#','#','#'], 
     ['#','#','#','#'], 
     ['#',' ',' ','#'], 
     ['#',' ',' ','#'], 
     ['#','#','#','#']]
  end
 
  it "should return according result  given [['x', 'x'], ['x', 'x']]" do
    @maze_builder.build([['x', 'x'], ['x', 'x']]).should ==[
      ['#','#','#','#', '#', '#', '#'], 
      ['#','#','#','#', '#', '#', '#'], 
      ['#','#','#','#', '#', '#', '#'], 
      ['#','#','#','#', '#', '#', '#'], 
      ['#','#','#','#', '#', '#', '#'], 
      ['#','#','#','#', '#', '#', '#'], 
      ['#','#','#','#', '#', '#', '#']]
  end

  it "should return according result  given [['x', 'x'], ['x', '_']]" do
    @maze_builder.build([['x', 'x'], ['x', '_']]).should ==[
      ['#','#','#','#', '#', '#', '#'], 
      ['#','#','#','#', '#', '#', '#'], 
      ['#','#','#','#', '#', '#', '#'], 
      ['#','#','#','#', '#', '#', '#'], 
      ['#','#','#','#', ' ', ' ', '#'], 
      ['#','#','#','#', ' ', ' ', '#'], 
      ['#','#','#','#', '#', '#', '#']]
  end
                
   it "should return according result  given [['x', 'x', 'x'], ['x', '_', 'x'], ['x', '_', 'x']]" do
     @maze_builder.build([['x', 'x', 'x'], ['x', '_', 'x'], ['x', 'x', '_']]).should ==[
       ['#','#','#','#', '#', '#', '#', '#', '#', '#'], 
       ['#','#','#','#', '#', '#', '#', '#', '#', '#'], 
       ['#','#','#','#', '#', '#', '#', '#', '#', '#'], 
       ['#','#','#','#', '#', '#', '#', '#', '#', '#'], 
       ['#','#','#','#', ' ', ' ', '#', '#', '#', '#'], 
       ['#','#','#','#', ' ', ' ', '#', '#', '#', '#'], 
       ['#','#','#','#', '#', '#', '#', '#', '#', '#'],
       ['#','#','#','#', '#', '#', '#', ' ', ' ', '#'],
       ['#','#','#','#', '#', '#', '#', ' ', ' ', '#'],
       ['#','#','#','#', '#', '#', '#', '#', '#', '#']]       
   end
end