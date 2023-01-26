require 'bank'

RSpec.describe Bank do
  it "should return correct balance after deposit 1000" do
    bank = Bank.new
    bank.deposit(1000)
    expect(bank.balance).to eq(1000)
  end

  it "should return correct balance after deposit 1000 and withdraw 500" do
    bank = Bank.new
    bank.deposit(1000)
    bank.withdraw(500)
    expect(bank.balance).to eq(500)
  end
end