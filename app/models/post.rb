class Post < ApplicationRecord
  belongs_to :user
  
  validates :content, presence: true
  
  def thumb_path
    user.avatar.url(:thumb)
  end
  
  def as_json(options = {})
    super.merge(created_at: created_at.strftime('%d.%m.%Y %H:%M:%S'))
  end
  
end
