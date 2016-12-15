Feature: Scanning single item
  As a shopper,
  I want to scan items
  So that I can find how much they cost

Scenario Outline: Scanning a single bag of chips
  Given I have a new Checkout Machine
  When I scan the sku <sku>
  Then the total price should be <price>
Examples:
| sku | price |
| 123 | 200   |
| 456 | 100   |
