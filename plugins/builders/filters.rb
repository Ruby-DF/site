class Builders::Filters < SiteBuilder
  def build
    helper :plural do |count, word|
      "#{count} #{word}#{count != 1 ? 's' : ''}"
    end

    helper :nearest_future_event do |events|
      events.filter { _1.date >= site.time }.min_by(&:date)
    end

    helper :nav_link do |current_url:, href:, label:|
      current_page_url = current_url == "/" ? current_url : current_url.sub(/\/$/, "")
      aria_current = (current_page_url == href) ? "page" : nil
      %(<a aria-current="#{aria_current}" href="#{helpers.relative_url(href)}">#{label}</a>).html_safe
    end
  end
end
