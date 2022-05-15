class Session < ApplicationRecord
  belongs_to :game
  belongs_to :gamemaster
  belongs_to :player
end
