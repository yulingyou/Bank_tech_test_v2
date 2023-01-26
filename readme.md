## Installation
Clone this repo ```git@github.com:yulingyou/Bank_tech_test_v2.git```
Language: Ruby
Test: RSpec, run 'rspec' to test

## Requirements
- You should be able to interact with your code via a REPL like IRB or Node. (You don't need to implement a command line interface that takes input from STDIN.)
- Deposits, withdrawal.
- Account statement (date, amount, balance) printing.
- Data can be kept in memory (it doesn't need to be stored to a database or anything).


Given a client makes a deposit of 1000 on 10-01-2023
And a deposit of 2000 on 13-01-2023
And a withdrawal of 500 on 14-01-2023
When she prints her bank statement
Then she would see

```
date || credit || debit || balance
14/01/2023 || || 500.00 || 2500.00
13/01/2023 || 2000.00 || || 3000.00
10/01/2023 || 1000.00 || || 1000.00
```

## Result

```
irb -r ./lib/bank.rb
3.0.0 :001 > bank = Bank.new
 => #<Bank:0x0000000152b18b38 @balance=0, @printer=#<Printer:0x0000000152b18ae8 @bank_statements=[]>, @bank_statement=Bank_statement> 
3.0.0 :002 > bank.deposit(1000)
 => [#<Bank_statement:0x0000000152a636e8 @date="26-01-2023", @credit="1000.00", @balance="1000.00">] 
3.0.0 :003 > bank.deposit(2000)                                 @credit="2000.00", @balance="3000.00">] 
3.0.0 :004 > bank.withdraw(500)
 => [#<Bank_statement:0x0000000152a636e8 @date="26-01-2023", @credit="1000.00", @balance="1000.00">, #<Bank_statement:0x0000000152b13908 @date="26-01-2023", @credit="2000.00", @balance="3000.00">, #<Bank_statement:0x0000000152a244c0 @date="26-01-2023", @balance="2500.00", @debit="500.00">] 
3.0.0 :005 > bank.printing_final_statement
date || credit || debit || balance 
26-01-2023 || 1000.00 ||  || 1000.00
26-01-2023 || 2000.00 ||  || 3000.00
26-01-2023 ||  || 500.00 || 2500.00
 => [#<Bank_statement:0x0000000152a636e8 @date="26-01-2023", @credit="1000.00", @balance="1000.00">, #<Bank_statement:0x0000000152b13908 @date="26-01-2023", @credit="2000.00", @balance="3000.00">, #<Bank_statement:0x0000000152a244c0 @date="26-01-2023", @balance="2500.00", @debit="500.00">] 
3.0.0 :006 > exit
```