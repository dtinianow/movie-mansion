class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.text :first_name
      t.text :last_name
      t.text :email

      t.timestamps
    end
  end
end
