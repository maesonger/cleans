class CreateCleanCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :clean_companies do |t|
      t.string :name
      validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
                    
      validates :tel, presence: true, length: { maximum: 11 }

      t.timestamps
    end
  end
end