class AddUserIdToDemand < ActiveRecord::Migration[5.2]
  def change
    add_column :demands, :user_id, :integer
  end
end
