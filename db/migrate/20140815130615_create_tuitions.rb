class CreateTuitions < ActiveRecord::Migration
  def change
    create_table :tuitions do |t|
    	t.string :year, default: Date.current.year
    	t.integer :amount, default: 0
    	t.boolean :current, default: false
    end
  end
end
