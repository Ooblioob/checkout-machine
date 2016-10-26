class CheckoutMachine
  def scan(sku)
    if sku == 123
      @total = 200
    elsif sku == 456
      @total = 100
    else
      @total = 1000
    end
  end

  def total
    @total
  end
end
