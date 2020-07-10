class Nhl::Team #model class
  attr_accessor :name, :abbreviation, :arena, :division, :conference, :first_year, :url

  @@all = []

  def initialize(attr_hash) #refactor-able?
    @name = attr_hash[:name]
    @abbreviation = attr_hash[:abbreviation]
    @arena = attr_hash[:arena]
    @conference = attr_hash[:conference]
    @division = attr_hash[:division]
    @first_year = attr_hash[:first_year]
    @url = attr_hash[:url]
    save
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

end
