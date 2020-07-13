class Match < ApplicationRecord
  belongs_to :hometeam
  belongs_to :awayteam
  accepts_nested_attributes_for :hometeam
  accepts_nested_attributes_for :awayteam
end
