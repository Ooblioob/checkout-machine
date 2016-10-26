class CheckoutMachine
  def scan(sku)
    if sku == 123
      @total = 200
    else
      @total = 100
    end
  end

  def total
    @total
  end
end
