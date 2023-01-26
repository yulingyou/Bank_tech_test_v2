require 'bank'

RSpec.describe Bank do
  it "should return correct balance after deposit 1000" do
    bank = Bank.new
    result = bank.deposit(1000)
    expect(result).to eq(1000)
  end
end