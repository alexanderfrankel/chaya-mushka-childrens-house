class CreateTuitions < ActiveRecord::Migration
  def change
    create_table :tuitions do |t|
    	t.string :year
    	t.integer :amount
    	t.boolean :current, default: false
    end
  end
end
