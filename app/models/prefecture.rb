class Prefecture < ApplicationRecord
  has_many :clean_prefectures
  has_many :clean_companies, through: :clean_prefectures
end
