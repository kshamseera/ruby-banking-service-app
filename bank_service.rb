require_relative "csv_util"
require_relative "company"

class BankService
  def initialize
  end

  # Create a Company with accounts
  #
  # @param [CSV] account_file csv file with account details.
  # @return [Company] company object
  def create_company(account_file)
    return Company.new(CsvUtil.loadAccounts(account_file))
  end

  # Process the Transactions and calculate and update the account balance.
  #
  # @param [Company] company company object.
  # @param [CSV] transactions_file csv file with transaction details.
  # @return [void]
  def process_transaction(company, transactions_file)
    company.process_transactions(CsvUtil.loadTransactions(company, transactions_file))
  end
end

bankService = BankService.new
company = bankService.create_company("data/accounts.csv")
bankService.process_transaction(company, "data/transactions.csv")
company.display_account_details
