require './product'
require './bonus_card'

class CheckoutMachine
  def initialize(args={})
    args = defaults.merge(args)
    @balance = args[:balance]
    @bonus_card = args[:bonus_card]
    @salsa_counter = args[:salsa_counter]
    @chip_counter = args[:chip_counter]

    @stock = args[:stock]
  end

  def defaults
    { balance: 0,
      bonus_card: BonusCard.new(sku: 000),
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
    scan_bonus_card(sku) # this still feels awkward...
  end

  def total
    apply_discount
    @balance
  end

  private

  def apply_discount
    if bonus_card_scanned?
      @balance -= 50 * @salsa_counter
      @balance -= 200 * (@chip_counter/3).floor
    end
  end

  def update_balance(sku)
    @balance += find_price(sku) unless sku == @bonus_card.sku
    if sku == 123
      @chip_counter += 1
    elsif sku == 456
      @salsa_counter += 1
    end
  end

  def find_price(sku)
    find_product(sku).price
  end

  def find_product(sku)
    @stock.find { |product| product.sku == sku }
  end

  def scan_bonus_card(sku)
    @bonus_card.scan(sku)
  end

  def bonus_card_scanned?
    @bonus_card.scanned
  end
end
