class Match < ApplicationRecord
  enum status: { wait: 0, live: 1, started: 2 }
  belongs_to :home_team, class_name: "Team"
  belongs_to :away_team, class_name: "Team"
  def teams
    [self.home_team, self.away_team]
  end
end
