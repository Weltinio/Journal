class Category < ApplicationRecord
    validates :title, presence: true
    validates :rating, presence: true
    validates :description, presence: true,
                            length: {minimum: 10}
    validates :user_id, presence: true
    belongs_to :user
    has_many :tasks
end
