class CleanPrefecture < ApplicationRecord
  belongs_to :clean_company
  belongs_to :prefecture

  validates :clean_company_id, presence:true
  validates :prefecture_id, presence:true
end