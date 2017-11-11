class Faketweet < ApplicationRecord
  validates :content, presence: true,
            length:{ maximum: 140,
                    too_long: "は最大%{count}文字まで使用できます"}
end
