require_relative '../lib/dollar'

RSpec.describe 'Dollar' do
  it 'multiplication' do
    five = Dollar.new(5)
    expect(Dollar.new(10)).to eq(five.times(2))
    expect(Dollar.new(15)).to eq(five.times(3))
  end

  it 'equality' do
    expect(Dollar.new(5).equals(Dollar.new(5))).to be_truthy
    expect(Dollar.new(5).equals(Dollar.new(6))).to be_falsy
  end
end