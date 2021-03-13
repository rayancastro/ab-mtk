class AddAbTokenToSegments < ActiveRecord::Migration[6.0]
  def change
    add_column :segments, :ab_token, :string
    add_index :segments, :ab_token, unique: true
  end
end
