class Sum < Expression
  attr_accessor :augend
  attr_accessor :addend

  def initialize(augend, addend)
    @augend = augend
    @addend = addend
  end
end
