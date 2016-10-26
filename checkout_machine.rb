class CheckoutMachine
  attr_reader :total

  def initialize
    @total = 0
  end

  def scan(sku)
    if sku == 123
      @total += 200
    elsif sku == 456
      @total += 100
    elsif sku == 789
      @total += 1000
    elsif sku == 111
      @total += 500
    end
  end
end
