class Product
  attr_reader :name, :sku
  def initialize(args)
    @name = args[:name]
    @sku = args[:sku]
  end
end

module ProductFactory
  def self.chips
    Product.new(name: 'chips', sku: 123)
  end

  def self.salsa
    Product.new(name: 'salsa', sku: 456)
  end

  def self.wine
    Product.new(name: 'wine', sku: 789)
  end

  def self.cigarettes
    Product.new(name: 'cigarettes', sku: 111)
  end
end
