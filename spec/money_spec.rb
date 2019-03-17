require 'byebug'

require_relative '../lib/bank'
require_relative '../lib/money'

RSpec.describe 'Money' do
  it 'equality' do
    expect(Money.dollar(5).equals(Money.dollar(5))).to be_truthy
    expect(Money.dollar(5).equals(Money.dollar(6))).to be_falsy
    expect(Money.franc(5).equals(Money.franc(5))).to be_truthy
    expect(Money.franc(5).equals(Money.franc(6))).to be_falsy
    expect(Money.franc(5).equals(Money.dollar(5))).to be_falsy
  end

  it 'currency' do
    expect('USD').to eq(Money.dollar(1).currency)
    expect('CHF').to eq(Money.franc(1).currency)
  end

  it 'multiplication' do
    five = Money.dollar(5)
    expect(five.times(2)).to eql Money.dollar(10)
    expect(five.times(3)).to eql Money.dollar(15)
  end

  context '#plus' do
    it 'simple addition' do
      five = Money.dollar(5)
      sum = five.plus(five)
      bank = Bank.new
      reduced = bank.reduce(sum, 'USD')
      expect(reduced).to eql Money.dollar(  10)
    end

    it 'returns Sum' do
      five = Money.dollar(5)
      result = five.plus(five)
      expect(result.augend).to eql five
      expect(result.addend).to eql five
    end
  end

  describe '#reduce' do
    it 'returns correct Money' do
      sum = Sum.new(Money.dollar(3), Money.dollar(4))
      bank = Bank.new
      result = bank.reduce(sum, 'USD')
      expect(result).to eql Money.dollar(7)
    end
  end
end