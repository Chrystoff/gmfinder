class Player < ApplicationRecord
    resourcify
    # after_create :assign_default_role

    has_many :sessions
    has_many :games, through: :sessions


    # def assign_default_role
    #     self.add_role(:player) if self.roles.blank?
    # end
end
