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

  def test_scan_salsa_expects_total_100
    # Arrange
    cm = CheckoutMachine.new

    # Act
    cm.scan(456)

    # Assert
    assert_equal 100, cm.total
  end

  def test_scan_wine_expects_total_1000
    # Arrange
    cm = CheckoutMachine.new

    # Act
    cm.scan(789)

    # Assert
    assert_equal 1000, cm.total
  end
end
