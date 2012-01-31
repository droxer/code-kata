class CurrencyFormatter
  
  def format dollar
    return "0 #{units}" if dollar.empty?
    
    unit = extract_unit dollar
    
    if bigger_than_hundred? dollar
      return format_unit(unit, format_bigger_than_one_hundred(dollar))
    else
      return format_unit(unit, format_small_than_one_hundred(dollar))
    end
    
  end

  private
  
  def extract_unit(dollar_str)
    unit = dollar_str.split(" ").last
    dollar_str.sub!(unit, "")
    unit
  end
  
  def rules
    {
       "one" => 1,
       "two" => 2,
       "three" => 3,
       "four" => 4,
       "five" => 5,
       "six" => 6,
       "seven" => 7,
       "eight" => 8,
       "nine" => 9,
       "ten" => 10,
       "eleven" => 11,
       "twelve" => 12,
       "thirteen" => 13,
       "fourteen" => 14,
       "fifteen" => 15,
       "sixteen" => 16,
       "seventeen" => 17,
       "eighteen" => 18,
       "nineteen" => 19,
       "twenty" => 20,
       "thirty" => 30,
       "fourty" => 40,
       "fifty" => 50,
       "sixty" => 60,
       "seventy" => 70,
       "eighty" => 80,
       "ninety" => 90,
     }
  end
  
  def units(unit = "dollar")
    { "dollar" => "$"}[unit]
  end
  
  def bigger_than_hundred?(dollar)
    dollar.include?("hundred")
  end
  
  def format_unit(unit, result)
    "#{result} #{units(unit)}"
  end
  
  def format_small_than_one_hundred(dollar)
    smaller_than_one_hundred(dollar)
  end
  
  def format_bigger_than_one_hundred(expression)
    hundred_part = expression.sub(/and/, "").split("hundred")[0]
    non_hundred_part = expression.sub(/and/, "").split("hundred")[1]
    
    smaller_than_one_hundred(hundred_part) * 100 + smaller_than_one_hundred(non_hundred_part)
  end

  def smaller_than_one_hundred dollar_in_string
    return 0 unless dollar_in_string
    dollar_in_string.split(" ").inject(0) {|result, item| result += rules[item]}
  end
end