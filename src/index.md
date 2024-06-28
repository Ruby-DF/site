---
layout: default
---

Ruby DF é o meetup de Ruby no Distrito Federal. Nosso objetivo é reunir a comunidade Ruby do DF e entorno para compartilhar conhecimento, experiências e fazer networking.

---

{% assign nearest_future_event = collections.events.resources | where_exp: "event", "event.date > site.time" | sort: "date" | first %}

{% if nearest_future_event %}

<div>
  <h2>🎉 Faltam {% render "days_until", date: nearest_future_event.date %} dias para o próximo meetup!</h2>

  {% render "event_description", event: nearest_future_event %}
</div>

{% else %}

## Próximo evento: em breve!

Estamos preparando o próximo meetup. Fique ligado nas [nossas redes
sociais](https://t.me/rubydf) para mais informações. Enquanto isso, você pode conferir
um pouco sobre as [edições passadas aqui](/events).

Se quiser ajudar na organização, dê uma olhada em [como você pode contribuir](/sponsoring).

{% endif %}

---

## Patrocínio

Se você ou sua empresa tem interesse em patrocinar o Ruby DF, veja [como você
pode ajudar](/sponsoring#como-você-pode-ajudar) e os [benefícios](/sponsoring#o-que-podemos-oferecer) de ser um patrocinador [aqui](/sponsoring). Se preferir, entre em
contato conosco pelo email <{{ site.metadata.email }}> para mais informações.

## Organização

Atualmente, o Ruby DF é organizado por [Matheus Richard](https://twitter.com/matheusrich) e acontece por volta de uma vez por quadrimestre.
