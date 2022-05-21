class Game < ApplicationRecord
    has_many :sessions
    has_many :gamemasters, through: :sessions
    has_many :players, through: :sessions

    has_one_attached :cover

    validates :name, presence: true, length: { minimum: 3}
    validates :system, presence: true
    validates :difficulty, presence: true, numericality: { in: 1..10 }
    validates :description, length: { maximum: 250 }
end
