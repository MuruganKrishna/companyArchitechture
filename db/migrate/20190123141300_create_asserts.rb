class CreateAsserts < ActiveRecord::Migration[5.2]
  def change
    create_table :asserts do |t|
      t.string :item_name
      t.string :item_price
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
