require_relative '../lib/dollar'

RSpec.describe 'Dollar' do
  it 'multiplication' do
    five = Dollar.new(5)
    product = five.times(2)
    expect(product.amount).to eq(10)
    product = five.times(3)
    expect(product.amount).to eq(15)
  end

  it 'equality' do
    expect(Dollar.new(5).equals(Dollar.new(5)))
  end
end