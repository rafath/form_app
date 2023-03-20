# frozen_string_literal: true

RSpec.describe ApplicationHelper, type: :helper do
  describe '#fizz_buzz' do
    it 'returns an array of 100 elements' do
      expect(helper.fizz_buzz.count).to eq(100)
    end

    it 'returns the correct values' do
      expect(helper.fizz_buzz).to eq([
        1, 2, 'Fizz', 4, 'Buzz', 'Fizz', 7, 8, 'Fizz', 'Buzz',
        11, 'Fizz', 13, 14, 'FizzBuzz', 16, 17, 'Fizz', 19, 'Buzz',
        'Fizz', 22, 23, 'Fizz', 'Buzz', 26, 'Fizz', 28, 29, 'FizzBuzz',
        31, 32, 'Fizz', 34, 'Buzz', 'Fizz', 37, 38, 'Fizz', 'Buzz',
        41, 'Fizz', 43, 44, 'FizzBuzz', 46, 47, 'Fizz', 49, 'Buzz',
        'Fizz', 52, 53, 'Fizz', 'Buzz', 56, 'Fizz', 58, 59, 'FizzBuzz',
        61, 62, 'Fizz', 64, 'Buzz', 'Fizz', 67, 68, 'Fizz', 'Buzz',
        71, 'Fizz', 73, 74, 'FizzBuzz', 76, 77, 'Fizz', 79, 'Buzz',
        'Fizz', 82, 83, 'Fizz', 'Buzz', 86, 'Fizz', 88, 89, 'FizzBuzz',
        91, 92, 'Fizz', 94, 'Buzz', 'Fizz', 97, 98, 'Fizz', 'Buzz'
      ])
    end
  end

  describe '#number_replacer' do
    it 'replaces numbers with the default substitute' do
      expect(helper.number_replacer('abc 123 def 345 6')).to eq('abc NUMBER def NUMBER NUMBER')
    end
  end

  describe '#sum_digits' do
    it 'returns the sum of the digits of a number' do
      expect(helper.sum_digits(31337)).to eq(8)
    end
  end
end
