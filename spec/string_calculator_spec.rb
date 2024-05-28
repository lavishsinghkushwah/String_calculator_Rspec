
require 'string_calculator'

RSpec.describe StringCalculator do
  describe '#add' do
    context 'when given an empty string' do
      it 'returns 0' do
        expect(StringCalculator.add('')).to eq(0)
      end
    end

    context 'when given a single number' do
      it 'returns that number' do
        expect(StringCalculator.add('1')).to eq(1)
      end
    end

    context 'when given two comma-separated numbers' do
      it 'returns the sum of those numbers' do
        expect(StringCalculator.add('1,5')).to eq(6)
      end
    end

    context 'when numbers are separated by new lines and commas' do
      it 'handles new lines between numbers' do
        expect(StringCalculator.add("1\n2,3")).to eq(6)
      end
    end

    context 'when given a custom delimiter' do
      it 'uses the custom delimiter to split the numbers' do
        expect(StringCalculator.add("//;\n1;2")).to eq(3)
      end
    end

    context 'when given negative numbers' do
      it 'raises an exception with negative numbers not allowed message' do
        expect { StringCalculator.add("-1,2,-3") }.to raise_error(RuntimeError, "negative numbers not allowed: -1,-3")
      end
    end
  end
end
