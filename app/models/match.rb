class Match < ApplicationRecord
  validates :home_team_id, presence: true
  validates :away_team_id, presence: true
  validates :start_match, presence: true
  validates :end_match, presence: true
  enum status: { wait: 0, live: 1, started: 2 }
  belongs_to :home_team, class_name: "Team"
  belongs_to :away_team, class_name: "Team"
  belongs_to :tournament
  def teams
    [self.home_team, self.away_team]
  end

  ransacker :start_match, type: :date do
    Arel.sql('date(start_match)')
  end

  ransacker :end_match, type: :date do
    Arel.sql('date(end_match)')
  end
end
