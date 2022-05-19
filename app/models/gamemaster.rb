class Gamemaster < ApplicationRecord
    resourcify

    has_many :sessions
    has_many :games, through: :sessions

    # validates :name, presence: true, length: { minimum: 3 }
end
