require "tzinfo"
require "icalendar"
require "icalendar/tzinfo"

class Calendar < Bridgetown::Component
  def initialize(events:, timezone:)
    @events = events
    @timezone = timezone
  end

  def publish
    calendar = Icalendar::Calendar.new

    calendar.timezone do |timezone|
      timezone.tzid = timezone_identifier
    end

    @events.each do |event|
      title = event.data.title
      datetime = event.data.date
      city = event.data.dig(:location, :city)
      address = event.data.dig(:location, :address)
      link = event.data.dig(:location, :link)
      url = event.absolute_url
      agenda = event.data.talks.filter_map { |talk| "- #{talk.title} (#{talk.speaker.name})" if talk.speaker }.join("\n\n")
      sponsors = event.data.sponsors.map(&:name).to_sentence(two_words_connector: ' e ', last_word_connector: ' e ')

      description = <<~DESCRIPTION
        Ruby DF - #{title}

        Localização:
        #{address}
        #{link}

        Agenda:
        #{agenda}

        Patrocinadores:
        #{sponsors}
      DESCRIPTION

      calendar.event do |e|
        e.dtstart     = ical_time(datetime)
        e.dtend       = ical_time(datetime + 2.hours)
        e.summary     = "Ruby DF - #{title}"
        e.location    = city
        e.url         = url
        e.description = description
      end
    end

    calendar.publish
  end

  def to_ical
    publish.to_ical
  end

  def render_in(_view_context, &block)
    to_ical
  end

  private

  def timezone_identifier
    @timezone
  end

  def timezone
    @timezone ||= TZInfo::Timezone.get(timezone_identifier)
  end

  def ical_timezone
    timezone.ical_timezone(timezone.now)
  end

  def ical_time(datetime)
    Icalendar::Values::DateTime.new(datetime, tzid: timezone_identifier)
  end
end
