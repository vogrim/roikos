class AddDefaultAccountAndAssignUsers < ActiveRecord::Migration
  def change

    firstAccount = Account.create name: "Roikos"

    User.update_all account_id: firstAccount.id
    Brand.update_all account_id: firstAccount.id
    Client.update_all account_id: firstAccount.id
    Bill.update_all account_id: firstAccount.id

  end
end
