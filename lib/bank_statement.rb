class Bank_statement 
  attr_accessor :date, :credit, :debit, :balance

  def initialize(date, credit, debit,balance) 
    @date = date
    @credit = credit
    @debit = debit
    @balance = balance

  end
end
