require 'byebug'

require_relative '../lib/dollar'
require_relative '../lib/franc'

RSpec.describe 'Dollar' do
  it 'multiplication' do
    five = Money.dollar(5)
    expect(Money.dollar(10)).to eql five.times(2)
    expect(Money.dollar(15)).to eql five.times(3)
  end

  it 'equality' do
    expect(Money.dollar(5).equals(Money.dollar(5))).to be_truthy
    expect(Money.dollar(5).equals(Money.dollar(6))).to be_falsy
    expect(Franc.new(5).equals(Franc.new(5))).to be_truthy
    expect(Franc.new(5).equals(Franc.new(6))).to be_falsy
    expect(Franc.new(5).equals(Money.dollar(5))).to be_falsy
  end

  it 'franc multiplication' do
    five = Franc.new(5)
    expect(Franc.new(10).equals(five.times(2))).to be_truthy
    expect(Franc.new(15).equals(five.times(3))).to be_truthy
  end
end