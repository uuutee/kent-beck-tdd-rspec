require_relative 'expression'

class Money < Expression
  attr_accessor :amount

  def initialize(amount, currency)
    @amount = amount
    @currency = currency
  end

  def equals(money)
    amount == money.amount && currency == money.currency
  end

  def currency
    @currency
  end

  def times(multiplier)
    Money.new(@amount * multiplier, @currency)
  end

  def plus(addend)
    Money.new(@amount + addend.amount, @currency)
  end

  def self.dollar(amount)
    Money.new(amount, 'USD')
  end

  def self.franc(amount)
    Money.new(amount, 'CHF')
  end

  # Javaと異なり、Rubyでの == は同一性の比較になる
  # RSpecでは eql での比較時に内部でオブジェクトの eql? を呼んでいるため、
  # eql? をオーバーライドすることで同値性の比較ができるようになる
  # https://github.com/rspec/rspec-expectations/blob/master/lib/rspec/matchers/built_in/eql.rb#L29
  #
  # なお、eq での比較時は == が呼ばれる
  # https://github.com/rspec/rspec-expectations/blob/master/lib/rspec/matchers/built_in/eq.rb#L35
  def eql?(obj)
    if obj.is_a?(Money)
      obj.amount == @amount
    else
      false
    end
  end
end