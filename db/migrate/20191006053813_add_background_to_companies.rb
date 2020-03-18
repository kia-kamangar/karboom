class AddBackgroundToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :background_image, :string
  end
end
