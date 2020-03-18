class CreateResumes < ActiveRecord::Migration[5.2]
  def change
    create_table :resumes do |t|
      t.string :resume_title
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
