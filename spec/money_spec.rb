require 'byebug'

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

  it 'simple addition' do
    five = Money.dollar(5)
    sum = five.plus(five)
    bank = Bank.new
    reduced = bank.reduce(sum, 'USD')
    expect(reduced).to eql Money.dollar(10)
  end
end