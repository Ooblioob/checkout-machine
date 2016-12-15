require './product'

class CheckoutMachine
  def initialize(args={})
    args = defaults.merge(args)
    @balance = args[:balance]
    @bonus_card_scanned = args[:bonus_card_scanned]
    @salsa_counter = args[:salsa_counter]
    @chip_counter = args[:chip_counter]
    @stock = args[:stock]
  end

  def defaults
    { balance: 0,
      bonus_card_scanned: false,
      salsa_counter: 0,
      chip_counter: 0,
      stock: { ProductFactory.chips.sku       => 200,
               ProductFactory.salsa.sku       => 100,
               ProductFactory.wine.sku        => 1000,
               ProductFactory.cigarettes.sku  => 550 }
    }
  end

  def scan(sku)
    update_balance(sku)

    @bonus_card_scanned = true if sku == 000
  end

  def total
    apply_discount
    @balance
  end

  private

  def apply_discount
    if @bonus_card_scanned
      @balance -= 50 * @salsa_counter
      @balance -= 200 * (@chip_counter/3).floor
    end
  end

  def update_balance(sku)
    @balance += @stock.fetch(sku, 0)
    if sku == 123
      @chip_counter += 1
    elsif sku == 456
      @salsa_counter += 1
    end
  end
end
