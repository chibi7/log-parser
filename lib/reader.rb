# frozen_string_literal: true

class Reader
  attr_reader :log_file_path, :log_entries

  def initialize(log_file_path)
    @log_file_path = log_file_path
    @log_entries = []
  end

  def call
    with_file do |line|
      url, ip = line.split
      @log_entries << { url: url, ip: ip }
    end
  end

  private

  def with_file
    File.open(log_file_path, "r") do |file|
      while (line = file.gets)
        yield line
      end
    end
  end
end
