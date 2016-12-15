class BonusCard
  attr_reader :sku
  attr_accessor :scanned
  def initialize(args={})
    @sku = args[:sku]
    @scanned = args.fetch(:scanned, false)
  end
end
