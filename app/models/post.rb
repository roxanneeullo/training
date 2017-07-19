class Post < ApplicationRecord
  belongs_to :user
  
  validates :content, presence: true, length: { maximum: 500 }
  def thumb_path
    user.avatar.url(:thumb)
  end
  
  def as_json(options = {})
    super.merge(created_at: created_at.localtime.strftime('%I:%M%p, %d %b, \'%y'))
  end
  
end
