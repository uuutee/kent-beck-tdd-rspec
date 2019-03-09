require_relative 'money'

class Dollar < Money
  def initialize(amount, currency)
    super(amount, currency)
  end

  def times(multiplier)
    Dollar.new(@amount * multiplier, @currency)
  end
end