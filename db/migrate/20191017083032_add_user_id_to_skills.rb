class AddUserIdToSkills < ActiveRecord::Migration[5.2]
  def change
    add_reference :skills, :user, foreign_key: true
  end
end
