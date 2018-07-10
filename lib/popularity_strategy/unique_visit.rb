# frozen_string_literal: true

require "popularity_strategy/base"

module PopularityStrategy
  class UniqueVisit < Base
    private

    def message
      "unique views"
    end

    def mapper(url, ip)
      [url, ip.uniq.size]
    end
  end
end
