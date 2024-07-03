---
layout: page
title: Histórico de eventos
---

{% assign past_events = collections.events.resources | where_exp: "event", "event.date < site.time" | sort: "date" | reverse %}

{% render "event_timeline", events: past_events %}
