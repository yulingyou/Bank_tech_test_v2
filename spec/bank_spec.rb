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

  it "should return correct balance after deposit 1000 and 2000 and withdraw 500" do
    bank = Bank.new
    bank.deposit(1000)
    bank.deposit(2000)
    bank.withdraw(500)
    expect(bank.balance).to eq(2500)
  end

  it "should printing correct bank statement with one bank statement(transaction) " do
    bank = Bank.new
    bank.create_bank_statement('10/01/2023',nil,1000, 1000)
    expect{bank.printing_final_statement}.to output("date || credit || debit || balance \n10/01/2023 ||  || 1000.00 || 1000.00\n").to_stdout
   
  end
end