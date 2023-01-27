require 'printer'

RSpec.describe Printer do 
  it "should print correct format" do
    fake_bank_statement = double(:fake_bank_statement, date:Time.new(2023, 1, 1), credit:'1000.00', debit:'', balance:'1000.00')
    printer = Printer.new
    printer.add_bank_statement(fake_bank_statement)
    expect(printer.printing_bank_statement).to eq([fake_bank_statement])
  end

  it "should print correct format with two transaction" do
    fake_bank_statement_1 = double(:fake_bank_statement_1, date:Time.new(2023, 1, 10), credit:'1000.00', debit:'', balance:'1000.00')
    fake_bank_statement_2 = double(:fake_bank_statement_2, date:Time.new(2023, 1, 8), credit:'1000.00', debit:'', balance:'1000.00')
    printer = Printer.new
    printer.add_bank_statement(fake_bank_statement_1)
    printer.add_bank_statement(fake_bank_statement_2)
    expect(printer.printing_bank_statement).to eq([fake_bank_statement_1,fake_bank_statement_2])
  end

  it "should print correct format with recent transaction show first" do
    fake_bank_statement_1 = double(:fake_bank_statement_1, date:Time.new(2023, 1, 6), credit:'1000.00', debit:'', balance:'1000.00')
    fake_bank_statement_2 = double(:fake_bank_statement_2, date:Time.new(2023, 1, 8), credit:'1000.00', debit:'', balance:'1000.00')
    printer = Printer.new
    printer.add_bank_statement(fake_bank_statement_1)
    printer.add_bank_statement(fake_bank_statement_2)
    expect(printer.printing_bank_statement).to eq([fake_bank_statement_2,fake_bank_statement_1])
  end
end