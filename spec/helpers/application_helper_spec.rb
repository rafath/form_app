# frozen_string_literal: true

RSpec.describe ApplicationHelper do
  describe '#fizz_buzz' do
    it 'returns an array of 100 elements' do
      expect(helper.fizz_buzz.count).to eq(100)
    end

    it 'returns the correct values' do
      expect(helper.fizz_buzz[0, 15]).to eq([1, 2, 'Fizz', 4, 'Buzz', 'Fizz', 7, 8, 'Fizz', 'Buzz',
                                             11, 'Fizz', 13, 14, 'FizzBuzz'])
    end
  end

  describe '#number_replacer' do
    it 'replaces numbers with the default substitute' do
      expect(helper.number_replacer('abc 123 def 345 6')).to eq('abc NUMBER def NUMBER NUMBER')
    end
  end

  describe '#sum_digits' do
    it 'returns the sum of the digits of a number' do
      expect(helper.sum_digits(31_337)).to eq(8)
    end
  end
end
