class Player < ApplicationRecord
    has_many :sessions, dependent: :destroy

    has_one_attached :profilepic

    validates :name, presence: true
    validates :experience, presence: true, numericality: { greater_than_or_equal_to: 0 }
    validates :availability, presence: true, length: { minimum: 2 }
    validates :about, length: { maximum: 250 }
end
