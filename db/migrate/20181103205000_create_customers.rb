class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :apikey
      t.boolean :private_content

      t.timestamps null: false
    end
  end
end
