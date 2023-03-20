# frozen_string_literal: true

module ApplicationHelper
  # rubocop:disable Metrics/MethodLength
  def fizz_buzz
    (1..100).map do |number|
      if (number % 3).zero? && (number % 5).zero?
        'FizzBuzz'
      elsif (number % 3).zero?
        'Fizz'
      elsif (number % 5).zero?
        'Buzz'
      else
        number
      end
    end
  end
  # rubocop:enable Metrics/MethodLength

  def number_replacer(str, substitute = 'NUMBER')
    str.gsub(/\d+/, substitute)
  end

  def sum_digits(number)
    sum = number.to_s.chars.sum(&:to_i)
    sum > 9 ? sum_digits(sum) : sum
  end
end
