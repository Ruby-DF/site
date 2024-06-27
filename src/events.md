---
layout: page
title: Histórico de eventos
---

<ol class="list-roman mx-auto w-fit" reversed>
  {% for event in collections.events.resources %}
    <li>
      <a href="{{ event.relative_url }}">{{ event.data.title }}</a>
    </li>
  {% endfor %}
</ol>
