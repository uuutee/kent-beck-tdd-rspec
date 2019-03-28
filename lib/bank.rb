class Bank
  attr_accessor :rates

  def initialize
    @rates = {}
  end

  def reduce(source, to)
    source.reduce(self, to)
  end

  def add_rate(from, to, rate)
    rates["#{from}_#{to}"] = rate
  end

  def rate(from, to)
    return 1 if from == to

    rates["#{from}_#{to}"]
  end
end
