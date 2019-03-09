require_relative 'money'

class Franc < Money
  def initialize(amount, currency)
    super(amount, currency)
  end

  def times(multiplier)
    Money.new(@amount * multiplier, @currency)
  end
end