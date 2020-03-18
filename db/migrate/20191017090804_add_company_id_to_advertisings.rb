class AddCompanyIdToAdvertisings < ActiveRecord::Migration[5.2]
  def change
    add_reference :advertisings, :company, foreign_key: true
  end
end
