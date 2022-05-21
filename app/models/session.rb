class Session < ApplicationRecord
  belongs_to :game
  belongs_to :gamemaster
  belongs_to :player

  has_one_attached :material

  validates :title, presence: true, length: { minimum: 3 }
  validates :length, presence: true, numericality: { minimum: 1 }
  validates :description, length: { maximum: 500 }
end
