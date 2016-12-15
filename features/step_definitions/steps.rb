require_relative '../../checkout_machine'

Given(/^I have a new Checkout Machine$/) do
  @machine = CheckoutMachine.new
end

When(/^I scan the sku (\d+)$/) do |sku|
  @machine.scan(sku.to_i)
end

Then(/^the total price should be (\d+)$/) do |amount|
  assert_equal amount.to_i, @machine.total
end
