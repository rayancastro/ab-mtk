class CreateSegments < ActiveRecord::Migration[6.0]
  def change
    create_table :segments do |t|
      t.string :name
      t.references :ab_test, null: false, foreign_key: true
      t.string :url
      t.integer :total_views, default: 0
      t.integer :total_conversions, default: 0

      t.timestamps
    end
  end
end
