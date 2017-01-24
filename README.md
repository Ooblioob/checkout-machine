# checkout-machine
A toy example checkout machine for certified scrum developer (CSD)

## Excella Ruby Book Club Change History

Changes made chapter by chapter based on practices recommended in 'Practical Object-Oriented Design in Ruby' by Sandi Metz

The original checkout machine code has been saved in the branch 'original-checkout-machine'. Each subsequent chapter had revsions saved in branch ch# (ch2 for Chapter 2, ch3 for Chapter 3 etc). These branches have been merged to master so that the contents of the master branch are current with our progress in the book.

Summary of changes:
* Chapter 2 (Designing Classes with a Single Responsibility): Created an Item class to hold item related data and future functionality and an Order class to hold order specific data and functionality.


## Problem  

You are a customer at a self-checkout market. You scan the stock keeping unit (SKU) of each product and review the total price you need to pay.

If you have a bonus card, you can scan your bonus card to receive discounts.  

Current deals with the bonus card include 1/2 off `salsa` as well as buy 2, get 1 free `chips`.

There is a 50 cents surcharge for tobacco products.

All scanned products must make a call to a _remote_ inventory control system that logs the scanned products for inventory control purposes (assume a REST webservice call).  

A seperate call is also made to an id verification system that returns whether to prompt for id or not.  

### Products

The store currently sells the following products:

| Name  | SKU  | Price (in cents)    | 
|-------|------|-----------|
| Chips | 123  | 200  |
| Salsa | 456  | 100  |
| Wine  | 1000 | 1000 | 
| Cigarettes | 111 | 500 | 

### Design 
```
class SelfCheckoutMachine
  def scan(sku)
    # scans a single item
  end
  
  def total
    # returns the total of all scanned 
    # items with discounts/taxes applied
  end
end
```
## Running Tests

Any tests should live in the `/tests` folder.  

To run tests, use `rake test` or `rake`
```
$ rake
Run options: --seed 51276

# Running:

..........

Finished in 0.001012s, 9884.4314 runs/s, 9884.4314 assertions/s.

10 runs, 10 assertions, 0 failures, 0 errors, 0 skips
``` 
