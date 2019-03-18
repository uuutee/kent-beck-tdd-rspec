class Bank
  def reduce(source, to)
    sum = source
    amount = sum.augend.amount + sum.addend.amount
    Money.new(amount, to)
  end
end
