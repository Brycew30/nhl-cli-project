class Nhl::CLI

  attr_reader :api
  attr_accessor :input

  def initialize
    @api = Nhl::TeamAPI.new
    @input = ""
  end

  def run
    welcome_message
    api.get_team_info #instantiates all teams
    sleep 0.9
    main_menu
  end

  def welcome_message
    puts ""
    puts "Welcome to the NHL info hub!"
    puts ""
  end

  def main_menu
    show_all_team_names
    input_prompt
    abbreviation_match = Nhl::Team.all.select do |team|
      "#{input}" == team.abbreviation
    end
    validate_input(abbreviation_match)
    return_message
  end

  def validate_input(abbreviation_match)
    if abbreviation_match == []
      puts ""
      puts "Sorry, I don't understand that input."
      sleep 1.2
      main_menu
    else
    #binding.pry
      show_team_details(abbreviation_match)
    end
  end

  def show_team_details(abbreviation_match)
    # binding.pry
    puts ""
    puts ""
    puts "#{abbreviation_match[0].name} (#{abbreviation_match[0].abbreviation})"
    puts "Arena: #{abbreviation_match[0].arena}"
    puts "Division: #{abbreviation_match[0].division}"
    puts "Conference: #{abbreviation_match[0].conference}"
    puts "Inaugural Year: #{abbreviation_match[0].first_year}"
    puts "Team Website: #{abbreviation_match[0].url}"
    puts ""
  end

  def input_prompt
    puts ""
    puts "Please type the 3 letter abbreviation for the team you'd like more info about, or type Q to quit"
    gets_user_input
  end

  def gets_user_input
    self.input = gets.chomp.upcase
  end

  def show_all_team_names #lists 31 teams with abbreviations next to them
    Nhl::Team.all.each do |team|
      puts "#{team.name} (#{team.abbreviation})"
    end
    nil
  end

  def return_message
    puts "Type 'list' to see the teams again, or type 'q' to quit."
    puts ""
    self.input = gets.strip

    if input == 'list'
      main_menu
    elsif input == 'q'
      puts ""
      puts "Thanks for reading. See you next time!"
      sleep 0.9
      exit
    else
      puts ""
      puts "I don't understand that input."
      puts "------------------------------------------------------"
      puts ""
      return_message
    end
  end
end
