class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user
  validates :user, uniqueness: { scope: :post, message: "You have already reacted to this post." }
end
