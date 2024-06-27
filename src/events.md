---
layout: page
title: Histórico de eventos
---

<ol class="list-roman mx-auto w-fit" reversed>
  {% for post in collections.posts.resources %}
    <li>
      <a href="{{ post.relative_url }}">{{ post.data.title }}</a>
    </li>
  {% endfor %}
</ol>
