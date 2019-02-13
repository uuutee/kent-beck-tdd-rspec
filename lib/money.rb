class Money
  attr_accessor :amount

  def equals(object)
    amount == object.amount
  end
end