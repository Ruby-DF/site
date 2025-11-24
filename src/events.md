---
layout: page
title: Histórico de eventos
template_engine: erb
---

<% past_events = collections.events.resources.select { it.date < site.time }.sort_by(&:date).reverse %>

<%= render "event_timeline", events: past_events %>
