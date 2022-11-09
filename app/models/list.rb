class List < ApplicationRecord
    has_one_attached :image #←これでlistモデル内にimageカラムが追記されたのと同じ意味。実際はされてない。

    #vlidates～で「必須入力」にできる
    validates :title, presence: true
    validates :body, presence: true
    validates :image, presence: true
end
