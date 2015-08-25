class Customer

  def initialize
    @placed = false
  end

  def placed?
    @placed
  end

  def affirmative
    @placed = true
  end
end
