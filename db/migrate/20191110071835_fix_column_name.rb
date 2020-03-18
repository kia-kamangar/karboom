class FixColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :demands, :jeb_description, :job_description
  end
end
