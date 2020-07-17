class Nhl::CLI

  # attr_reader :api
  attr_accessor :input

  def initialize
    @api = Nhl::TeamAPI.new
    @input = ""
    @font = TTY::Font.new(:straight)
  end

  def run
    welcome_message
    Nhl::TeamAPI.get_team_info #instantiates all teams
    sleep 2.4
    main_menu
  end

  def welcome_message
    puts ""
    puts Rainbow(@font.write("WELCOME")).silver.bg(:black).bright
    puts Rainbow(@font.write("TO THE")).silver.bg(:black).bright
    puts Rainbow(@font.write("NHL TEAM")).silver.bg(:black).bright
    puts Rainbow(@font.write("DIRECTORY")).silver.bg(:black).bright
    puts ""
    puts ""
  end

  def main_menu
    puts ""
    show_all_team_names
    input_prompt
    abbreviation_match = Nhl::Team.all.select {|team| "#{input}" == team.abbreviation}
    validate_input(abbreviation_match)
    return_message
  end

  def show_all_team_names
    Nhl::Team.order.each do |team|
      puts Rainbow("#{team.name} (#{team.abbreviation})").black.bg(:silver).bright
    end
    nil
  end

  def input_prompt
    puts ""
    puts Rainbow("Please type the 3 letter abbreviation for the team you'd like more info about.").blue.bright
    gets_user_input
  end

  def gets_user_input
    self.input = gets.chomp.upcase
  end

  def validate_input(abbreviation_match)
    if abbreviation_match == []
      puts ""
      puts Rainbow("-------------------------------------").red.bright
      puts Rainbow("Sorry, I don't understand that input.").red.bright
      puts Rainbow("-------------------------------------").red.bright
      sleep 1.2
      puts ""
      puts ""
      puts ""
      main_menu
    else
      show_team_details(abbreviation_match)
    end
  end

  def show_team_details(abbreviation_match)
    puts ""
    puts ""
    puts Rainbow("#{abbreviation_match[0].name} (#{abbreviation_match[0].abbreviation})").bright.underline
    puts Rainbow("Arena: #{abbreviation_match[0].arena}").bright
    puts Rainbow("Division: #{abbreviation_match[0].division}").bright
    puts Rainbow("Conference: #{abbreviation_match[0].conference}").bright
    puts Rainbow("Inaugural Year: #{abbreviation_match[0].first_year}").bright
    puts Rainbow(TTY::Link.link_to("Team Website:", "#{abbreviation_match[0].url}")).bright
    puts Rainbow("(press cmd+double click the link above for more information!)").faint
    puts ""
  end

  def return_message
    puts ""
    puts Rainbow("Type 'list' to see the teams again, or type 'q' to quit.").blue.bright
    puts ""
    self.input = gets.strip
    puts ""
    puts ""

    if input == 'list'
      main_menu
    elsif input == 'q'
      puts ""
      puts Rainbow("------------------------------------------").green.bright
      puts Rainbow("| Thanks for reading! See you next time! |").green.bright
      puts Rainbow("------------------------------------------").green.bright
      sleep 1.5
      exit
    else
      puts ""
      puts Rainbow("------------------------------------------------------").red.bright
      puts Rainbow("Sorry, I don't understand that input.").red.bright
      puts Rainbow("------------------------------------------------------").red.bright
      puts ""
      puts ""
      sleep 1.0
      return_message
    end
  end
end
