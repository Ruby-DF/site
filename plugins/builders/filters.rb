class Builders::Filters < SiteBuilder
  def build
    liquid_filter :days_until_today do |time|
      (time.to_date - site.time.to_date).to_i
    end

    liquid_filter :nearest_future_event do |events|
      events.filter { _1.date >= site.time }.min_by(&:date)
    end
  end
end
