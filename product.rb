class Product
  attr_reader :name, :sku, :price
  def initialize(args)
    @name = args[:name]
    @sku = args[:sku]
    @price = args[:price]
  end
end

module ProductFactory
  def self.chips(price: )
    Product.new(name: 'chips', sku: 123, price: price)
  end

  def self.salsa(price: )
    Product.new(name: 'salsa', sku: 456, price: price)
  end

  def self.wine(price: )
    Product.new(name: 'wine', sku: 789, price: price)
  end

  def self.cigarettes(price: )
    Product.new(name: 'cigarettes', sku: 111, price: price)
  end
end
