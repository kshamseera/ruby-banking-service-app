require "csv"
require_relative "account"

class CsvUtil

  # Read the accounts from csv file, return Array of accounts.
  def self.loadAccounts(account_file)
    accounts = []
    CSV.foreach(account_file, headers: true) do |row|
      number = row["number"].to_i
      balance = row["balance"].to_f
      accounts << Account.new(number, balance)
    end
    return accounts
  end

  # Read the Transactions from csv file, return Array of transactions.
  def self.loadTransactions(company, transations_file)
    transactions = []
    CSV.foreach(transations_file, headers: true) do |row|
      source_number = row["source"].to_i
      destination_number = row["destination"].to_i
      amount = row["amount"].to_f
      transactions << company.createTransaction(source_number, destination_number, amount)
    end
    return transactions
  end
end
