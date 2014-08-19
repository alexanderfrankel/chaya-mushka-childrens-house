class AddAdministratorIdToUsers < ActiveRecord::Migration
  def change
  	add_reference :users, :administrator, index: true
  end
end
