class CreateForms < ActiveRecord::Migration
  def change
    create_table :forms do |t|
      t.string :name
      t.string :receiver
      t.references :customer, index: true, foreign_key: true


      t.timestamps null: false
    end
  end
end
