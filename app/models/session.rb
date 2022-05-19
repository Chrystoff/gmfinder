class Session < ApplicationRecord
  resourcify

  belongs_to :game
  belongs_to :gamemaster
  belongs_to :player
end
