class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :posts
  has_many :comments
  has_many :likes
  has_many :liked_posts, through: :likes, source: :post
  has_many :hisses
  has_many :hissed_posts, through: :hisses, source: :post
  has_many :commented_posts, through: :comments, source: :post
  has_many :relationships
  has_many :relations, through: :relationships, source: :relation
  has_many :inverse_relationships, class_name: "Relationship", foreign_key: "relation_id"
  has_many :inverse_relations, through: :inverse_relationships, source: :user
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :petname, uniqueness: true

  has_attached_file :image, :styles => { :medium => "300x300#", :thumb => "50x50#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def has_liked?(post)
    liked_posts.include?(post)
  end
end
