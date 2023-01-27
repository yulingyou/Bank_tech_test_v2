# Bank tech test



## Installation
1. Clone this repo ```git@github.com:yulingyou/Bank_tech_test_v2.git```
2. Run ```bundle install```

## Technologies
1. Language: ruby 3.0.0
2. Test: RSpec, run 'rspec' to test
3. Gem 'simplecov', check the coverage of tests

## Specification
### Requirements
- You should be able to interact with your code via a REPL like IRB or Node. (You don't need to implement a command line interface that takes input from STDIN.)
- Deposits, withdrawal.
- Account statement (date, amount, balance) printing.
- Data can be kept in memory (it doesn't need to be stored to a database or anything).


### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2023  
**And** a deposit of 2000 on 13-01-2023  
**And** a withdrawal of 500 on 14-01-2023  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2023 || || 500.00 || 2500.00
13/01/2023 || 2000.00 || || 3000.00
10/01/2023 || 1000.00 || || 1000.00
```

## Result
1. Same day transaction
```
> irb -r ./lib/bank.rb
3.0.0 :001 > bank = Bank.new
 => #<Bank:0x000000012e92bec0 @balance=0, @printer=#<Printer:0x000000012e92b2e0 @bank_statements=[]>, @bank_statement=Ba... 
3.0.0 :002 > bank.deposit(1000)
 => [#<Bank_statement:0x000000012fa15380 @date=2023-01-27 10:39:55.165997 +0000, @credit="1000.00", @balance="1000.00">] 
3.0.0 :003 > bank.deposit(2000)
 => [#<Bank_statement:0x000000012fa15380 @date=2023-01-27 10:39:55.165997 +0000, @credit="1000.00", @balance="1000.00">, #<Bank_statement:0x000000012f944140 @date=2023-01-27 10:40:00.848746 +0000, @credit="2000.00", @balance="3000.00">] 
3.0.0 :004 > bank.withdraw(500)
 => [#<Bank_statement:0x000000012fa15380 @date=2023-01-27 10:39:55.165997 +0000, @credit="1000.00", @balance="1000.00">, #<Bank_statement:0x000000012f944140 @date=2023-01-27 10:40:00.848746 +0000, @credit="2000.00", @balance="3000.00">, #<Bank_statement:0x000000012f9f4e00 @date=2023-01-27 10:40:06.787529 +0000, @balance="2500.00", @debit="500.00">] 
3.0.0 :005 > bank.printing_final_statement
date || credit || debit || balance 
27/01/2023 ||  || 500.00 || 2500.00
27/01/2023 || 2000.00 ||  || 3000.00
27/01/2023 || 1000.00 ||  || 1000.00
 => [#<Bank_statement:0x000000012f9f4e00 @date=2023-01-27 10:40:06.787529 +0000, @balance="2500.00", @debit="500.00">, #<Bank_statement:0x000000012f944140 @date=2023-01-27 10:40:00.848746 +0000, @credit="2000.00", @balance="3000.00">, #<Bank_statement:0x000000012fa15380 @date=2023-01-27 10:39:55.165997 +0000, @credit="1000.00", @balance="1000.00">] 
```

2. Different day transaction
```
> irb -r ./lib/bank.rb
3.0.0 :001 > bank = Bank.new
 => #<Bank:0x00000001363f1768 @balance=0, @printer=#<Printer:0x00000001363f1718 @bank_statements=[]>, @bank_statement=Ba... 
3.0.0 :002 > bank.create_bank_statement(Time.new(2023, 1, 10),1000,nil, 1000)
 => [#<Bank_statement:0x000000013633a590 @date=2023-01-10 00:00:00 +0000, @credit="1000.00", @balance="1000.00">] 
3.0.0 :003 > bank.create_bank_statement(Time.new(2023, 1, 13),2000,nil, 3000)
 => [#<Bank_statement:0x000000013633a590 @date=2023-01-10 00:00:00 +0000, @credit="1000.00", @balance="1000.00">, #<Bank_statement:0x00000001361d8468 @date=2023-01-13 00:00:00 +0000, @credit="2000.00", @balance="3000.00">] 
3.0.0 :004 > bank.create_bank_statement(Time.new(2023, 1, 14),nil,500, 2500)
 => [#<Bank_statement:0x000000013633a590 @date=2023-01-10 00:00:00 +0000, @credit="1000.00", @balance="1000.00">, #<Bank_statement:0x00000001361d8468 @date=2023-01-13 00:00:00 +0000, @credit="2000.00", @balance="3000.00">, #<Bank_statement:0x000000013637b450 @date=2023-01-14 00:00:00 +0000, @balance="2500.00", @debit="500.00">] 
3.0.0 :005 > bank.printing_final_statement
date || credit || debit || balance 
14/01/2023 ||  || 500.00 || 2500.00
13/01/2023 || 2000.00 ||  || 3000.00
10/01/2023 || 1000.00 ||  || 1000.00
 => [#<Bank_statement:0x000000013637b450 @date=2023-01-14 00:00:00 +0000, @balance="2500.00", @debit="500.00">, #<Bank_statement:0x00000001361d8468 @date=2023-01-13 00:00:00 +0000, @credit="2000.00", @balance="3000.00">, #<Bank_statement:0x000000013633a590 @date=2023-01-10 00:00:00 +0000, @credit="1000.00", @balance="1000.00">] 
 ```

## Test Coverage
```
Coverage report generated for RSpec to /Users/daisy/Projects/week9/Bank_tech_test_v2/coverage. 99 / 99 LOC (100.0%) covered.
```