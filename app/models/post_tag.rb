class PostTag < ApplicationRecord
  # postモデル、tagモデルそれぞれ一つづつと関連
  belongs_to :post
  belongs_to :tag
end
