require 'printer'

RSpec.describe Printer do 
  it "should print correct format" do
    fake_bank_statement = double(:fake_bank_statement, date:'10/01/2023', credit:'1000.00', debit:'', balance:'1000.00')
    printer = Printer.new
    expect(printer.printing_bank_statement(fake_bank_statement)).to eq("date || credit || debit || balance \n 10/01/2023 || 1000.00 ||  || 1000.00")
  end
end