require 'minitest/autorun'
require_relative 'checkout_machine'

class CheckoutMachineTest < Minitest::Test
  def test_scan_chips_expects_total_200
    # Arrange
    cm = CheckoutMachine.new

    # Act
    cm.scan(123)

    # Assert
    assert_equal 200, cm.total
  end
end
