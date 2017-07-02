class CreateCleanCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :clean_companies do |t|
      t.string :name
      t.string :tel

      t.timestamps
    end
  end
end