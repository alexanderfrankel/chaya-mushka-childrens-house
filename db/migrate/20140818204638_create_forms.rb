class CreateForms < ActiveRecord::Migration
  def change
    create_table :forms do |t|
    	t.string :title
    	t.string :description
    	t.string :url
    	t.references :user

    	t.timestamps
    end
  end
end
