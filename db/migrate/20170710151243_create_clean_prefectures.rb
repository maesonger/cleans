class CreateCleanPrefectures < ActiveRecord::Migration[5.0]
  def change
    create_table :clean_prefectures do |t|
      t.references :clean_company, foreign_key: true
      t.references :prefecture, foreign_key: true

      t.timestamps
      
      t.index [:clean_company_id, :prefecture_id], unique: true
      
    end
  end
end
