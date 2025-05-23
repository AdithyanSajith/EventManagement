class CreatePayments < ActiveRecord::Migration[7.2]
  def change
    create_table :payments do |t|
      t.references :registration, null: false, foreign_key: true
      t.decimal :amount
      t.string :status
      t.string :method

      t.timestamps
    end
  end
end
