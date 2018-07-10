# frozen_string_literal: true

require "popularity_strategy/base"

module PopularityStrategy
  class Visit < Base
    private

    def message
      "visits"
    end

    def mapper(url, ip)
      [url, ip.size]
    end
  end
end
