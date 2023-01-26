require 'bank_statement'

RSpec.describe Bank_statement do
  it "should return the bank_statement" do 
    bank_statement = Bank_statement.new('10/01/2023',1000,0,1000)
    expect(bank_statement.date).to eq('10/01/2023')
    expect(bank_statement.credit).to eq(1000)
    expect(bank_statement.debit).to eq(0)
    expect(bank_statement.balance).to eq(1000)
  end

end