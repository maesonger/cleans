class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :account_type
      t.string :email
      t.string :tel
      t.string :password_digest
      
      t.timestamps
    end
  end
end