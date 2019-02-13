require_relative 'money'

class Franc < Money
  attr_accessor :amount

  def initialize(amount)
    @amount = amount
  end

  def times(multiplier)
    Franc.new(@amount * multiplier)
  end

  def equals(object)
    amount == object.amount
  end
end