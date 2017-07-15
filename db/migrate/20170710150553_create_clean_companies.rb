class CreateCleanCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :clean_companies do |t|
      t.references :user, foreign_key: true
      
      t.string :name
      t.string :tel
      t.string :email
      t.string :image_url
      t.timestamps
    end
  end
end
