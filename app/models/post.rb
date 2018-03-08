class Post < ApplicationRecord
  belongs_to :postable, polymorphic: true
  validates :title, presence: true, length: { minimum: 3 }
  validates :body, presence: true, length: { maximum: 1000 }
end
