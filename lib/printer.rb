class Printer
  def printing_bank_statement(bank_statement)
    return header +  " #{bank_statement.date} || #{bank_statement.credit} || #{bank_statement.debit} || #{bank_statement.balance}"
  end

  def header
    return "date || credit || debit || balance \n"
  end
end