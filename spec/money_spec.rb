require_relative '../lib/dollar'

RSpec.describe 'Dollar' do
  it 'multiplication' do
    five = Dollar.new(5)
    expect(Dollar.new(10).equals(five.times(2))).to be_truthy
    expect(Dollar.new(15).equals(five.times(3))).to be_truthy
  end

  it 'equality' do
    expect(Dollar.new(5).equals(Dollar.new(5))).to be_truthy
    expect(Dollar.new(5).equals(Dollar.new(6))).to be_falsy
  end
end