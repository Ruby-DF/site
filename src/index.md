---
# Feel free to add content and custom Front Matter to this file.

layout: default
---

Ruby DF é o meetup de Ruby no Distrito Federal. Nosso objetivo é reunir a comunidade Ruby do DF e entorno para compartilhar conhecimento, experiências e fazer networking.

---

{% assign nearest_future_event = collections.events.resources | where_exp: "event", "event.date > site.time" | sort: "date" | first %}

{% if nearest_future_event %}

<div>
  <h2>🎉 Faltam {% render "days_until", date: nearest_future_event.date %} dias para o próximo meetup!</h2>

  <p>Para mais informações, acesse <a href="{{ nearest_future_event.relative_url }}">a página do evento</a>.</p>
</div>

{% else %}

## Próximo evento: em breve!

Estamos preparando o próximo meetup. Fique ligado nas [nossas redes
sociais](t.me/rubydf) para mais informações. Enquanto isso, você pode conferir
um pouco sobre as [edições passadas aqui](/events).

Se quiser ajudar na organização, dê uma olhada em [como você pode contribuir](/sponsoring).

{% endif %}

