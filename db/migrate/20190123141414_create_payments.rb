class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.string :rent
      t.string :internet
      t.string :server
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
