class Bank
  def initialize
    @date = Time.now
    @balance = 0
  end

  def deposit(credit)
    update_balance(credit: credit)
  end

  def update_balance(credit: nil, debit: nil)
    @balance += credit if credit
  end

end