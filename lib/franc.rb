require_relative 'money'

class Franc < Money
  def initialize(amount)
    @amount = amount
    @currency = 'CHF'
  end

  def times(multiplier)
    Franc.new(@amount * multiplier)
  end

  def currency
    @currency
  end
end