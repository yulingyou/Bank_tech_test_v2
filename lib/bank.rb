class Bank
  def initialize
    @date = Time.now
    @balance = 0
  end

  def deposit(credit)
    update_balance(credit: credit)
  end

  def withdraw(debit)
    update_balance(debit: debit)
  end

  def update_balance(credit: nil, debit: nil)
    @balance += credit if credit
    @balance -= debit if debit
  end

  def balance
    @balance
  end

end