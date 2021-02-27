class Task < ApplicationRecord
    validates :body, presence: true, length: {minimum: 10}
    validates :date, presence: true
    validates :title, presence: true, length: {minimum: 3}
    belongs_to :category
end
