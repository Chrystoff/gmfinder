class Player < ApplicationRecord
    has_many :sessions
    has_many :games, through: :sessions

    has_one_attached :profilepic
end
