require 'minitest/autorun'
require_relative '../checkout_machine'

class ItemTest < Minitest::Test
  def setup
    @item = Item.new(123, 200) # chips
  end

  def test_item_returns_chip_sku
    assert_equal 123, @item.sku
  end
end