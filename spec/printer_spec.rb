require 'printer'

RSpec.describe Printer do 
  it "should print correct format" do
    fake_bank_statement = double(:fake_bank_statement, date:'10/01/2023', credit:'1000.00', debit:'', balance:'1000.00')
    printer = Printer.new
    printer.add_bank_statement(fake_bank_statement)
    expect(printer.printing_bank_statement).to eq([fake_bank_statement])
  end

  it "should print correct format with two transaction" do
    fake_bank_statement_1 = double(:fake_bank_statement, date:'10/01/2023', credit:'1000.00', debit:'', balance:'1000.00')
    fake_bank_statement_2 = double(:fake_bank_statement, date:'08/01/2023', credit:'1000.00', debit:'', balance:'1000.00')
    printer = Printer.new
    printer.add_bank_statement(fake_bank_statement_1)
    printer.add_bank_statement(fake_bank_statement_2)
    expect(printer.printing_bank_statement).to eq([fake_bank_statement_1,fake_bank_statement_2])
  end
end