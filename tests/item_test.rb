require 'minitest/autorun'
require_relative '../checkout_machine'
require_relative '../item'

class ItemTest < Minitest::Test
  def setup
    @item = Item.new(123, 200) # chips
  end

  def test_order_returns_chip_sku
    assert_equal 123, @item.sku
  end

  def test_item_returns_chip_price
    assert_equal 200, @item.price
  end
end