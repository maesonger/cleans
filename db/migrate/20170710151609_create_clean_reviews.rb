class CreateCleanReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :clean_reviews do |t|
      t.references :user, foreign_key: true
      t.references :clean_company, foreign_key: true
      t.string :point
      t.string :comment
      
      t.timestamps
      
      t.index [:user_id, :clean_company_id], unique: true
      
    end
  end
end
