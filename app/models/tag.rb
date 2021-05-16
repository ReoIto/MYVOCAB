class Tag < ApplicationRecord
  # 中間テーブルであるpost_tagモデルを介してpostモデルと関連
  has_many :post_tags, dependent: :destroy
  has_many :posts, through: :post_tags
end
