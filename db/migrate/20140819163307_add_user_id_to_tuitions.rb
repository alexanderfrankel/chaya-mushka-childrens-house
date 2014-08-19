class AddUserIdToTuitions < ActiveRecord::Migration
  def change
  	add_reference :tuitions, :user, index: true
  end
end
