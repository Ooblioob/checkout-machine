# Data and behaviors related to items sold in the store
class Item
  attr_accessor :sku, :price
  
  def initialize(sku, price=0)
    @sku = sku
    @price = price
  end
end