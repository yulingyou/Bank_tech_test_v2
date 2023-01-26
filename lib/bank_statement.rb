class Bank_statement 
  attr_accessor :date, :credit, :debit, :balance

  def initialize(date, credit, debit ,balance) 
    @date = date
    @credit = '%.2f' % credit if credit
    @debit = '%.2f' % debit if debit
    @balance = '%.2f' % balance if balance
  end
end
