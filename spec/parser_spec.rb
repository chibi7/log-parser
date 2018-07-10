# frozen_string_literal: true

require "spec_helper"
require "parser"

RSpec.describe Parser do
  subject { described_class.new([]) }

  describe "#show_most_popular" do
    let(:strategy_object) { instance_double PopularityStrategy::Base }

    before { allow(strategy_class).to receive(:new).and_return(strategy_object) }

    context "when calls with unique set to true" do
      let(:strategy_class) { PopularityStrategy::UniqueVisit }

      it "calls PopularityStrategy::UniqueVisit" do
        expect(strategy_object).to receive(:call)
        subject.show_most_popular(unique: true)
      end
    end

    context "when calls without unique" do
      let(:strategy_class) { PopularityStrategy::Visit }

      it "calls PopularityStrategy::Visit" do
        expect(strategy_object).to receive(:call)
        subject.show_most_popular
      end
    end
  end
end
