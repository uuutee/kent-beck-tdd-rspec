class Bank
  def reduce(source, to)
    return source if source.is_a?(Money)

    sum = source
    sum.reduce(to)
  end
end
