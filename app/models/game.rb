class Game < ApplicationRecord
    has_many :sessions
    has_many :gamemasters, through: :sessions
    has_many :players, through: :sessions
end
