class CreateDemands < ActiveRecord::Migration[5.2]
  def change
    create_table :demands do |t|
      t.string :job_title
      t.text :jeb_description
      t.integer :salary

      t.timestamps
    end
  end
end
