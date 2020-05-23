class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :address
      t.string :pay_type
      t.string :email

      t.timestamps
    end
  end
end
