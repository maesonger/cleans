class AddColumnToCleanCompany < ActiveRecord::Migration[5.0]
  def change
    add_column :clean_companies, :email, :string
    add_column :clean_companies, :image_url, :string
  end
end
