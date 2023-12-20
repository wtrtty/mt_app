class Like < ApplicationRecord
              #あなたから
  belongs_to :from_user, class_name: "User", foreign_key: :from_user_id
  #belongs_to :follower, class_name: "User"
              #あなたへ
  belongs_to :to_user, class_name: "User", foreign_key: :to_user_id
  #belongs_to :followed, class_name: "User"
  validates :from_user_id, presence: true
  #validates :follower_id, presence: true
  validates :to_user_id, presence: true
  #validates :followed_id, presence: true
end
