class CreateCharges < ActiveRecord::Migration[5.0]
  def change
    create_table :charges do |t|
      t.references:clean_company, foreign_key:true
      t.string:square_meters_min
      t.string:square_meters_max
      t.integer:charge
      t.timestamps
    end
  end
end
