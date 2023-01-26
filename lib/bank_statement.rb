class Bank_statement 
  attr_accessor :date, :credit, :debit, :balance

  def initialize(date, credit, debit ,balance) 
    @date = date
    @credit = '%.2f' % credit
    @debit = '%.2f' % debit
    @balance = '%.2f' % balance
  end
end
