---
layout: page
title: Histórico de eventos
---

<ul>
  <!-- em ordem reversa: mais novos primeiro -->
  {% for post in collections.posts.resources | reverse %}
    <li>
      <a href="{{ post.relative_url }}">{{ post.data.title }}</a>
    </li>
  {% endfor %}
</ul>
