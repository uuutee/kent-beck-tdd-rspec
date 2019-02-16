class Money
  attr_accessor :amount

  def equals(money)
    amount == money.amount
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