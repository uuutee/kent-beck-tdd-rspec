require_relative '../lib/dollar'

RSpec.describe 'Dollar' do
  it '複数回掛け算しても元の値が変わらないこと' do
    five = Dollar.new(5)
    product = five.times(2)
    expect(product.amount).to eq(10)
    product = five.times(3)
    expect(product.amount).to eq(15)
  end
end