class BonusCard
  attr_reader :sku, :price
  def initialize(args={})
    @sku = args[:sku]
    @price = 0
  end
end
