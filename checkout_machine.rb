class CheckoutMachine
  def initialize
    @balance = 0
    @bonus_card_scanned = false
    @salsa_counter = 0
  end

  def scan(sku)
    if sku == 123
      @balance += 200
    elsif sku == 456
      @salsa_counter += 1
      @balance += 100
    elsif sku == 789
      @balance += 1000
    elsif sku == 111
      @balance += 500
    elsif sku == 000
      @bonus_card_scanned = true
    end
  end

  def total
    if @bonus_card_scanned
      @balance -= 50 * @salsa_counter
    end
    @balance
  end
end
