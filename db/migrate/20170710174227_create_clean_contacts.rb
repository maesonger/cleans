class CreateCleanContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :clean_contacts do |t|

      t.timestamps
    end
  end
end
