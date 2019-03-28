class Pair
  attr_accessor :from
  attr_accessor :to

  def initialize(from, to)
    @from = from
    @to = to
  end

  def equals(pair)
    from == pair.from && to == pair.to
  end
end
