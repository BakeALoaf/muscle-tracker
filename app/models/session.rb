class Session < ApplicationRecord
  has_many :trackers
  belongs_to :user
end
