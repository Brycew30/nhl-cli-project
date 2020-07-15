class Nhl::Team #model class
  attr_reader :name, :abbreviation, :arena, :division, :conference, :first_year, :url

  @@all = []

  def initialize(attr_hash)
    @name = attr_hash[:name]
    @abbreviation = attr_hash[:abbreviation]
    @arena = attr_hash[:arena]
    @division = attr_hash[:division]
    @conference = attr_hash[:conference]
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
