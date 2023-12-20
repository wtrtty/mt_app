class User < ApplicationRecord
  attr_accessor :remember_token
  before_save { self.email = email.downcase }
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 211 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 4 }, allow_nil: true
  validates :birthday,  presence: true
  validates :live,  presence: true

  mount_uploader :avatar, AvatarUploader  #画像追加

  #like
  has_many :likes_from, class_name: "Like", foreign_key: :from_user_id, dependent: :destroy
  #has_many :active_relationships,  class_name:  "Relationship", foreign_key: "follower_id", dependent:   :destroy
  has_many :likes_to, class_name: "Like", foreign_key: :to_user_id, dependent: :destroy
  #has_many :passive_relationships, class_name:  "Relationship", foreign_key: "followed_id", dependent:   :destroy
  has_many :active_likes, through: :likes_from, source: :to_user  # 自分からのいいね
  #has_many :following, through: :active_relationships,  source: :followed
  has_many :passive_likes, through: :likes_to, source: :from_user # 相手からのいいね
  #has_many :followers, through: :passive_relationships, source: :follower

  #チャットルーム
  has_many :chat_room_users
  has_many :chat_rooms, through: :chat_room_users

  has_many :messages

  # 渡された文字列のハッシュ値を返す
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  #年齢設定
  def age
    d1=self.birthday.strftime("%Y%m%d").to_i
    d2=Date.today.strftime("%Y%m%d").to_i
    return (d2 - d1) / 10000
  end

  #画像アップ
  def avatar

  end

  # ランダムなトークンを返す
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # 永続化セッションのためにユーザーをデータベースに記憶する
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token)) #:image?
    remember_digest
  end

  # セッションハイジャック防止のためにセッショントークンを返す
  # この記憶ダイジェストを再利用しているのは単に利便性のため
  def session_token
    remember_digest || remember
  end

  # 渡されたトークンがダイジェストと一致したらtrueを返す
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # ユーザーのログイン情報を破棄する
  def forget
    update_attribute(:remember_digest, nil) #:image?
  end

  # ユーザーをlikeする
  def do_like(other_user)
    active_likes << other_user unless self == other_user
  end
  # ユーザーをフォローする
  #def follow(other_user)
   # following << other_user unless self == other_user
  #end

  # ユーザーのlikeを削除する
  def delete_like(other_user)
    active_likes.delete(other_user)
  end
  # ユーザーをフォロー解除する
  #def unfollow(other_user)
   # following.delete(other_user)
  #end

  # 現在のユーザーが他のユーザーをlikeしていればtrueを返す
  def active_likes?(other_user)
    active_likes.include?(other_user)
  end
  # 現在のユーザーが他のユーザーをフォローしていればtrueを返す
  #def following?(other_user)
   # following.include?(other_user)
  #end
end
