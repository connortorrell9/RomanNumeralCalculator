class RomanNumeralCalculator

  $roman_values = Hash["I" => 1, "IV" => 4, "V" => 5, "IX" => 9, "X" => 10, 
    "XL" => 40, "L" => 50, "XC" => 90, "C" => 100, 
    "CD" => 400, "D" => 500, "CM" => 900, "M" => 1000]

  def to_decimal(roman_number)
    previous_roman_numeral = -1
    roman_number.upcase.chars.reverse_each.sum do |current_roman_character|
      current_roman_numeral = $roman_values[current_roman_character]
      multiplier = current_roman_numeral >= previous_roman_numeral ? 1 : -1
      previous_roman_numeral = current_roman_numeral
      current_roman_numeral * multiplier      
    end
  end

  def passed_decimal_number(roman_number_value, decimal_value)
    roman_number_value > decimal_value
  end

  def to_roman(decimal_number)
    if $roman_values.key(decimal_number) != nil
      $roman_values.key(decimal_number)
    else
      roman_value = ""
      decimal_value = decimal_number
      until decimal_value == 0
        i = 0
        while i < $roman_values.length
          if passed_decimal_number($roman_values.values[i], decimal_value)
            decimal_value -= $roman_values.values[i - 1]
            roman_value += $roman_values.keys[i - 1]
            i = $roman_values.length
          else
            i += 1
          end
        end
      end
      roman_value
    end
  end

  def add(roman_operand_1, roman_operand_2)
    decimal_operand_1 = to_decimal(roman_operand_1)
    decimal_operand_2 = to_decimal(roman_operand_2)
    decimal_sum = decimal_operand_1 + decimal_operand_2
    to_roman(decimal_sum)
  end

  def subtract(roman_operand_1, roman_operand_2)
    decimal_operand_1 = to_decimal(roman_operand_1)
    decimal_operand_2 = to_decimal(roman_operand_2)
    decimal_sum = decimal_operand_1 - decimal_operand_2
    to_roman(decimal_sum)
  end

  def multiply(roman_operand_1, roman_operand_2)
    decimal_operand_1 = to_decimal(roman_operand_1)
    decimal_operand_2 = to_decimal(roman_operand_2)
    decimal_sum = decimal_operand_1 * decimal_operand_2
    to_roman(decimal_sum)
  end

  def divide(roman_operand_1, roman_operand_2)
    decimal_operand_1 = to_decimal(roman_operand_1)
    decimal_operand_2 = to_decimal(roman_operand_2)
    decimal_sum = decimal_operand_1 / decimal_operand_2
    to_roman(decimal_sum)
  end

end