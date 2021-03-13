class AddTokenToAbTests < ActiveRecord::Migration[6.0]
  def change
    add_column :ab_tests, :token, :string
    add_index :ab_tests, :token, unique: true
  end
end
