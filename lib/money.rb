class Money
  attr_accessor :amount

  def equals(money)
    amount == money.amount
  end
end