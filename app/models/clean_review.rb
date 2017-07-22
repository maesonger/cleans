class CleanReview < ApplicationRecord
  belongs_to :user
  belongs_to :clean_company
  
  validates :user_id, presence:true
  validates :clean_company_id, presence:true
  
  validates :point, presence: true, length: { maximum: 5 }
  validates :comment, presence: true, length: { maximum: 255 }
  
  
  def getpoint
    if self.point <= "5" && self.point > "4"
      '⭐️⭐⭐⭐⭐️'
    elsif self.point <= "4" && self.point > "3"
      '⭐⭐⭐⭐'
    elsif self.point <= "3" && self.point > "2"
      '⭐⭐⭐'
    elsif self.point <= "2" && self.point > "1"
      '⭐⭐'
    elsif self.point <= "1"
      '⭐'
    end
  end

  # [吉田実装]
  # point カラムの型が string になってしまっているため、
  # Postgres で AVG がエラーになってしまう
  # よって、値を取得して配列に保持してから、データベースではなく、
  # Ruby の世界で平均値を算出する
  def self.avg(reviews)
    points = reviews.pluck(:point)
    sum = points.inject(0) { |total, i| total + i.to_f }
    i = points.length
    sum.to_f / i
  end

end