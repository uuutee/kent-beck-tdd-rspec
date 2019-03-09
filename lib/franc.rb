require_relative 'money'

class Franc < Money
  def initialize(amount, currency)
    super(amount, currency)
  end

  def times(multiplier)
    Franc.new(@amount * multiplier, 'CHF')
  end
end