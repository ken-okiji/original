class Record < ActiveRecord::Base
  
  #それぞれの投稿は特定の1人のユーザーのもの
  belongs_to :user
  
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
end
