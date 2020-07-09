class TeamAPI
  BASE_URL = "https://statsapi.web.nhl.com/api/v1/teams"

  def get_team_info
    response = HTTParty.get(BASE_URL)
    teams_array = response["teams"]
    teams_array.each do |team_hash|
      team_hash
      info_hash = {
        name: team_hash["name"],
        abbreviation: team_hash["abbreviation"],
        arena: team_hash["venue"]["name"],
        division: team_hash["division"]["name"],
        conference: team_hash["conference"]["name"],
        first_year: team_hash["firstYearOfPlay"],
        url: team_hash["officialSiteUrl"]
      }
      Team.new(info_hash)
    end
  end
end


# class TeamAPI
#   BASE_URL = "https://statsapi.web.nhl.com/api/v1/teams"
#
#   def get_team_names
#     team_names = HTTParty.get(BASE_URL)
#
#     team_names["teams"].each do |team_name_hash|
#     Teams.new(team_name_hash["name"], team_name_hash["abbreviation"])
#     end
#     # binding.pry
#   end
#
#
# end
