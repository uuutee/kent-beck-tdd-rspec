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

    context 'same currency' do
      it 'returns Money' do
        sum = Money.dollar(1).plus(Money.dollar(1))
        expect(sum).to be_a(Money)
      end
    end
  end

  describe '#reduce' do
    it 'returns correct Money' do
      sum = Sum.new(Money.dollar(3), Money.dollar(4))
      bank = Bank.new
      result = bank.reduce(sum, 'USD')
      expect(result).to eql Money.dollar(7)
    end

    it 'recive Money as an arguments' do
      bank = Bank.new
      result = bank.reduce(Money.dollar(1), 'USD')
      expect(result).to eql Money.dollar(1)
    end

    context 'when different currency' do
      it 'can be converted' do
        bank = Bank.new
        bank.add_rate('CHF', 'USD', 2)
        result = bank.reduce(Money.franc(2), 'USD')
        expect(result).to eql Money.dollar(1)
      end

      it 'mixed addition' do
        five_bucks = Money.dollar(5)
        ten_francs = Money.franc(10)
        bank = Bank.new
        bank.add_rate('CHF', 'USD', 2)
        result = bank.reduce(five_bucks.plus(ten_francs), 'USD')
        expect(result).to eql Money.dollar(10)
      end
    end
  end

  describe '#rate' do
    context 'when same currency' do
      it 'returns 1' do
        expect(Bank.new.rate('USD', 'USD')).to eq(1)
      end
    end
  end
end

RSpec.describe 'Sum' do
  describe '#plus' do
    it 'plus different currency' do
      five_bucks = Money.dollar(5)
      ten_francs = Money.franc(10)
      bank = Bank.new
      bank.add_rate('CHF', 'USD', 2)
      sum = Sum.new(five_bucks, ten_francs).plus(five_bucks)
      result = bank.reduce(sum, 'USD')
      expect(result).to eql Money.dollar(15)
    end
  end

  describe '#times' do
    it 'times different currency' do
      five_bucks = Money.dollar(5)
      ten_francs = Money.dollar(10)
      bank = Bank.new
      bank.add_rate('CHF', 'USD', 2)
      sum = Sum.new(five_bucks, ten_francs).times(2)
      result = bank.reduce(sum, 'USD')
      expect(result).to eql Money.dollar(30)
    end
  end
end
