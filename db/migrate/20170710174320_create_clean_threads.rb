class CreateCleanThreads < ActiveRecord::Migration[5.0]
  def change
    create_table :clean_threads do |t|
      t.references :user, foreign_key: true
      t.references :clean_company, foreign_key: true
      
      t.timestamps
      
      t.index [:user_id, :clean_company_id], unique: true
    end
  end
end
