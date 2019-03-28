require_relative 'pair'

class Bank
  attr_accessor :rates

  def initialize
    @rates = {}
  end

  def reduce(source, to)
    source.reduce(self, to)
  end

  def add_rate(from, to, rate)
    pair = Pair.new(from, to)
    rates["#{pair.from}_#{pair.to}"] = rate
  end

  def rate(from, to)
    return 1 if from == to

    pair = Pair.new(from, to)
    rates["#{pair.from}_#{pair.to}"]
  end
end
