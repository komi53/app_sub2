class Book < ApplicationRecord
	belongs_to :user
	validates :title,    length: { in: 1..200 }
	validates :body,    length: { in: 1..200 }
	validates :user_id, presence: true

def user
	User.find(self.user_id)
end
end
