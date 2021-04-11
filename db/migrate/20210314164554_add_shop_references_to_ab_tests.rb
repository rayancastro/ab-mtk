class AddShopReferencesToAbTests < ActiveRecord::Migration[6.0]
  def change
    add_reference :ab_tests, :shop, null: false, foreign_key: true
  end
end
