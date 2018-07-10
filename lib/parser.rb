# frozen_string_literal: true

$LOAD_PATH << File.dirname(__FILE__)

require "reader"
require "popularity_strategy/unique_visit"
require "popularity_strategy/visit"

class Parser
  attr_reader :log_entries

  def initialize(log_entries)
    @log_entries = log_entries
  end

  def show_most_popular(unique: false)
    strategy_class = unique ? PopularityStrategy::UniqueVisit : PopularityStrategy::Visit
    strategy_class.new(log_entries).call
  end
end

log_file_path = ARGV[0]

if log_file_path
  reader = Reader.new(log_file_path)
  reader.call

  parser = Parser.new(reader.log_entries)
  parser.show_most_popular
  puts "-----------"
  parser.show_most_popular(unique: true)
else
  puts "USAGE: ./parser.rb PATH_TO_LOG_FILE"
end
