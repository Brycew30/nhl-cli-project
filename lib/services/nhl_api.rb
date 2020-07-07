class TeamAPI
  BASE_URL = "https://statsapi.web.nhl.com/api/v1/teams"

  def get_team_names
    team_names = HTTParty.get(BASE_URL)

    team_names["teams"].each do |team_name_hash|
    Teams.new(team_name_hash["name"], team_name_hash["abbreviation"])
    end
    # binding.pry
  end


end
