class CreateAdvertisings < ActiveRecord::Migration[5.2]
  def change
    create_table :advertisings do |t|
      t.string :job_title
      t.text :job_description
      t.integer :salary

      t.timestamps
    end
  end
end
