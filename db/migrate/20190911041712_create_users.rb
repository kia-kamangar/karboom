class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :last_name
      t.integer :age
      t.boolean :gender
      t.integer :tel

      t.timestamps
    end
  end
end
