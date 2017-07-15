class Charge < ApplicationRecord
  belongs_to:clean_company
  
  validates :clean_company_id, presence: true
  validates :square_meters_min, presence: true
  validates :square_meters_max, presence: true
  validates :charge, presence: true
end
