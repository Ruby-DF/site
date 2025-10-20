class Builders::Filters < SiteBuilder
  def build
    helper :plural do |count, word|
      "#{count} #{word}#{count != 1 ? 's' : ''}"
    end

    helper :nearest_future_event do |events|
      events.filter { _1.date >= site.time }.min_by(&:date)
    end
  end
end
