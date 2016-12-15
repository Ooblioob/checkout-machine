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
      # this is at least more readable, and separates price from product
      stock: [ ProductFactory.chips(price: 200),
               ProductFactory.salsa(price: 100),
               ProductFactory.wine(price: 1000),
               ProductFactory.cigarettes(price: 550)
             ]
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
    @balance += find_product_by_sku(sku).price
    if sku == 123
      @chip_counter += 1
    elsif sku == 456
      @salsa_counter += 1
    end
  end

  def find_product_by_sku(sku)
    # Sigh, looks like I have to do a stupid hack here...
    @stock.find { |product| product.sku == sku } || Product.new(price: 0)
  end
end
