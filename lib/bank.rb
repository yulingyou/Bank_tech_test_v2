require './lib/printer.rb'
require './lib/bank_statement.rb'

class Bank
  def initialize
    @balance = 0
    @printer = Printer.new
    @bank_statement = Bank_statement
    
  end

  def deposit(credit)
    date = Time.now
    update_balance(date: date,credit: credit)
  end

  def withdraw(debit)
    date = Time.now
    update_balance(date: date,debit: debit)
  end

  def balance
    @balance
  end

  def printing_final_statement
    @printer.printing_bank_statement
  end

  def create_bank_statement(date, credit, debit, balance)
    bank_statement = @bank_statement.new(date, credit, debit, balance)
    @printer.add_bank_statement(bank_statement)
  end

  
  private

  def update_balance(date: nil,credit: nil, debit: nil)
    @balance += credit if credit
    @balance -= debit if debit
    create_bank_statement(date, credit, debit, @balance)
  end

end