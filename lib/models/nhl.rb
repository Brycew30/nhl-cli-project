class Teams #model class
  attr_accessor :name, :venue, :abbreviation, :first_year, :conference, :division

  @@all = []

  def initialize(name, abbreviation)
    @name = name
    @abbreviation = abbreviation
    @@all << self
  end

  def self.all
    @@all
  end

  def self.print_all_team_names
    all.each do |team|
      puts "#{team.name} (#{team.abbreviation})"
    end
    nil
  end
end
