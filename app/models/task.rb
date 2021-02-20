class Task < ApplicationRecord
    validates :body, presence: true, length: {minimum: 3}
    validates :date, presence: true
    belongs_to :category
end
