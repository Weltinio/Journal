class Category < ApplicationRecord
    validates :title, presence: true
    validates :rating, presence: true
    validates :description, presence: true,
                            length: {minimum: 10}
    has_many :tasks
end
