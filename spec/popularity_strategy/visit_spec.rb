# frozen_string_literal: true

require "spec_helper"
require "popularity_strategy/visit"

RSpec.describe PopularityStrategy::Visit do
  subject { described_class.new(log_entries).call }

  let(:log_entries) do
    [
      { url: "/test", ip: "126.318.035.038" },
      { url: "/test", ip: "126.318.035.039" },
      { url: "/test/1", ip: "126.318.035.038" },
      { url: "/test/1", ip: "126.318.035.038" },
      { url: "/test/2", ip: "126.318.035.038" }
    ]
  end

  let(:expected_message) do
    <<~MSG
      /test/1 2 visits
      /test 2 visits
      /test/2 1 visits
    MSG
  end

  it "print expected message" do
    expect { subject }.to output(expected_message).to_stdout
  end
end
