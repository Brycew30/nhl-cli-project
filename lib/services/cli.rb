class CLI

  def call
    welcome_message
    TeamAPI.new.get_team_names
    main_menu
  end

  def welcome_message
    puts "Welcome to the NHL info hub!"
  end

  def main_menu
    puts Teams.print_all_team_names
    puts "Please type the 3 letter abbreviation for the team you'd like more info about"
    # input = gets.upcase.chomp
    # while input != 'Q' do
    #   if input.length < 3 || input.length > 3
    #     puts "I don't understand that input, please use the 3 letter abbreviation of the team you'd like to see or type Q to quit."
    #idea: "type 3 letter abbreviation of team you'd like to learn about or type
    #q to quit"
    #if a correct abbreviation is entered, go to team info (also has back to menu option)
    #if not, reply "I don't understand that input, please use the 3
    #letter abbreviation of the team you'd like to see to type q to quit"
  end
end
