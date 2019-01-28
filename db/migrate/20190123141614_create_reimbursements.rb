class CreateReimbursements < ActiveRecord::Migration[5.2]
  def change
    create_table :reimbursements do |t|
      t.string :purpose
      t.integer :cost
      t.references :employee, foreign_key: true

      t.timestamps
    end
  end
end
