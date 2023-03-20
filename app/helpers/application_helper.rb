# frozen_string_literal: true

module ApplicationHelper
  def fizz_buzz
    (1..100).map do |number|
      if number % 3 == 0 && number % 5 == 0
        'FizzBuzz'
      elsif number % 3 == 0
        'Fizz'
      elsif number % 5 == 0
        'Buzz'
      else
        number
      end
    end
  end

  def number_replacer(str, substitute = 'NUMBER')
    str.gsub(/\d+/, substitute)
  end

  def sum_digits(number)
    sum = number.to_s.chars.map(&:to_i).reduce(:+)
    sum > 9 ? sum_digits(sum) : sum
  end
end
