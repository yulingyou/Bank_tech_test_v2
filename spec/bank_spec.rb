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

  it "should printing correct bank statement format with one bank statement(transaction) " do
    bank = Bank.new
    bank.create_bank_statement('10/01/2023',1000,nil, 1000)
    expect{bank.printing_final_statement}.to output("date || credit || debit || balance \n10/01/2023 || 1000.00 ||  || 1000.00\n").to_stdout
  end

  it "should printing correct bank statement format with three bank statement(transaction) " do
    bank = Bank.new
    bank.create_bank_statement('10/01/2023',1000,nil, 1000)
    bank.create_bank_statement('13/01/2023',2000,nil, 3000)
    bank.create_bank_statement('14/01/2023',nil,500, 2500)
    expect{bank.printing_final_statement}.to output("date || credit || debit || balance \n14/01/2023 ||  || 500.00 || 2500.00\n13/01/2023 || 2000.00 ||  || 3000.00\n10/01/2023 || 1000.00 ||  || 1000.00\n").to_stdout
  end
end