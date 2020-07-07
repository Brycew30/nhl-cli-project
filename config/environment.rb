require 'httparty'
require 'pry'

require_relative '../lib/services/cli.rb'
require_relative '../lib/services/nhl_api.rb'
require_relative '../lib/services/version.rb'
require_relative '../lib/models/nhl.rb'

module Nhl
  class Error < StandardError; end
  # Your code goes here...
end
