class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :authentication_keys => [:login]
         
  attr_accessor :login
  belongs_to :department
  has_many :posts,  dependent: :destroy
  validates :username, presence: true, uniqueness: true, format: { with: /\A[a-zA-Z0-9]+\Z/ }, length: { maximum: 20 }
  validates :department, presence: true
  validates :email, presence: true, uniqueness: true, format: { without: /\s/ }, length: { maximum: 20 }
  validates :first_name, presence: true, length: { maximum: 20 }
  validates :last_name, presence: true, length: { maximum: 20 }
  validates :password, length: { maximum: 20 }
  
  has_attached_file :avatar, :styles => { :thumb => "200x200>" }, default_url: "/images/:style/axolotl.jpg"
  validates_attachment :avatar,
    content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
  validates_with AttachmentSizeValidator, attributes: :avatar, less_than: 2.megabytes
  
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end
  
  ransacker :full_name do |parent|
    Arel::Nodes::InfixOperation.new('||',
      Arel::Nodes::InfixOperation.new('||',
        parent.table[:first_name], Arel::Nodes.build_quoted(' ')
      ),
      parent.table[:last_name]
    )
  end
  
  def thumb_path
    avatar.url(:thumb)
  end
      
end
