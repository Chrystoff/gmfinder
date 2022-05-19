class Game < ApplicationRecord
    has_many :sessions
    has_many :gamemasters, through: :sessions
    has_many :players, through: :sessions

    has_one_attached :cover
end
