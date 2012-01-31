module CardComparable
  def compare(x, y)
    cards.index(x.point) <=> cards.index(y.point)
  end
  private
  def cards
    ['3', '4', '5', '6', '7', '8', '9', '10','J','Q','K', '1', '2','SK', 'BK']
  end
end