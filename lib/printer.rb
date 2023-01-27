class Printer
  def  initialize
    @bank_statements = []
  end

  def printing_bank_statement
    @bank_statements.sort! { |a,b|  (b.date) <=> (a.date)}
    puts header
    @bank_statements.each { |statement| puts "#{statement.date.strftime('%d/%m/%Y')} || #{statement.credit} || #{statement.debit} || #{statement.balance}"}
  end

  def add_bank_statement(bank_statement)
    @bank_statements << bank_statement
  end

  def header
    return "date || credit || debit || balance \n"
  end
end