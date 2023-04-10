require "csv"
require_relative "account"
require_relative "transaction"
require_relative "csv_util"

class Company
  def initialize(accounts)
    @accounts = accounts.map { |account| [account.number, account] }.to_h
  end

  def createTransaction(source_number, destination_number, amount)
    source_account = @accounts[source_number]
    destination_account = @accounts[destination_number]
    return Transaction.new(source_account, destination_account, amount)
  end

  def display_account_details
    puts "Account Balance Details:"
    puts "Account Number   | Balance"
    puts "--------------------------"
    @accounts.values.each do |account|
      puts "#{account.number} | #{account.balance}"
    end
  end

  # To process a transaction, this method process process the transaction only if the transaction is valid
  def process_transactions(transactions)
    transactions.each do |transaction|
      if transaction.valid?
        transaction.execute
      end
    end
  end
end
