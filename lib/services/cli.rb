class CLI

  attr_reader :api, :input

  def initialize
    @api = TeamAPI.new
    @input = ""
  end

  def run
    welcome_message
    api.get_team_info #instantiates all teams
    main_menu
  end

  def welcome_message
    puts "Welcome to the NHL info hub!"
  end

  def main_menu
    show_all_team_names
    input_prompt

    #if a correct abbreviation is entered, go to team info (also has back to menu option)
    #if not, reply "I don't understand that input, please use the 3
    #letter abbreviation of the team you'd like to see to type q to quit"
    end
  end

  def input_prompt
    puts "Please type the 3 letter abbreviation for the team you'd like more info about, or type Q to quit"
    gets_user_input
  end

  def gets_user_input
    self.input = gets.chomp
  end

  def show_all_team_names #lists 31 teams with abbreviations next to them
    Team.all.each do |team|
      puts "#{team.name} (#{team.abbreviation})"
    end
    nil
  end
end


# class CLI
#
#   attr_accessor :input
#
#   def initialize
#     @input = ""
#   end
#
#   def call
#     welcome_message
#     TeamAPI.new.get_team_names
#     main_menu
#   end
#
#   def welcome_message
#     puts "Welcome to the NHL info hub!"
#   end
#
#   def main_menu
#     print_all_team_names
#
#     receive_input
#     while input != 'Q' do
#       if input.length < 3 || input.length > 3
#         puts "I don't understand that input."
#       else
#         puts "That's good input."
#       end
#     #if a correct abbreviation is entered, go to team info (also has back to menu option)
#     #if not, reply "I don't understand that input, please use the 3
#     #letter abbreviation of the team you'd like to see to type q to quit"
#     receive_input
#     end
#   end
#
#   def receive_input
#     puts "Please type the 3 letter abbreviation for the team you'd like more info about, or type Q to quit"
#     self.input = gets.upcase.chomp
#   end
#
#   def print_all_team_names
#     Teams.all.each do |team|
#       puts "#{team.name} (#{team.abbreviation})"
#     end
#     nil
#   end
# end
