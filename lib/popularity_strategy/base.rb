# frozen_string_literal: true

module PopularityStrategy
  class Base
    attr_reader :log_entries

    def initialize(log_entries)
      @log_entries = log_entries
    end

    def call
      grouped_log_entries.sort_by { |_, counter| counter }.reverse_each do |url, counter|
        puts "#{url} #{counter} #{message}"
      end
    end

    def grouped_log_entries
      log_entries.group_by { |log_entry| log_entry[:url] }.map { |url, ip| mapper(url, ip) }.to_h
    end
  end
end
