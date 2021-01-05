class AddColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name,               :string, null: false
    add_column :users, :prefecture_id,      :integer
    add_column :users, :gender_id,          :integer
    add_column :users, :text,               :text,   null: false
  end
end
