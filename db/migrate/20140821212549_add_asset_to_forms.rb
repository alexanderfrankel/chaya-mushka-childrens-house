class AddAssetToForms < ActiveRecord::Migration
  def change
    add_column :forms, :asset, :string
  end
end
