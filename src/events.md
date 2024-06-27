---
layout: page
title: Histórico de eventos
---

{% assign past_events = collections.events.resources | where_exp: "event", "event.date < site.time" | sort: "date" | reverse %}

<ol class="list-roman mx-auto w-fit" reversed>
  {% for event in past_events %}
    <li>
      <a href="{{ event.relative_url }}">{{ event.data.title }}</a>
    </li>
  {% endfor %}
</ol>
