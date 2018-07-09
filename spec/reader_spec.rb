# frozen_string_literal: true

require "spec_helper"
require "reader"

RSpec.describe Reader do
  subject { described_class.new(log_file_path) }

  context "when file exists" do
    let(:log_file_path) { "spec/fixtures/10_lines.log" }

    before { subject.call }

    it "read ten log entries" do
      expect(subject.log_entries.count).to eq 10
    end
  end

  context "when file doesn't exist" do
    let(:log_file_path) { "spec/fixtures/wrong_file.log" }

    it "raises error" do
      expect { subject.call }.to raise_error(Errno::ENOENT)
    end
  end
end
