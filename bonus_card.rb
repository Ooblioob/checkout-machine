class BonusCard
  attr_reader :sku, :scanned
  def initialize(args={})
    @sku = args[:sku]
    @scanned = args.fetch(:scanned, false)
  end

  def scan(sku)
    @scanned = true if sku == @sku
  end
end
