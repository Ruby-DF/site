---
layout: default
---

{% assign nearest_future_event = collections.events.resources | where_exp: "event", "event.date >= site.time" | sort: "date" | first %}

{% if nearest_future_event %}

{% assign one_day_before_event = nearest_future_event.date | date: '%s' | minus: 86400 | date: '%Y-%m-%d' %}
{% assign today = 'now' | date: '%Y-%m-%d' %}
{% assign event_date = nearest_future_event.date | date: '%Y-%m-%d' %}

{% if today == event_date %}
  <h1 class="mb-8">🎉 É hoje! Aguardamos você!</h1>
{% elsif today == one_day_before_event %}
  <h1 class="mb-8">🎉 É amanhã! Aguardamos você!</h1>
{% else %}
  <h1 class="mb-8">🎉 Faltam {% render "days_until", date: nearest_future_event.date %} dias para o próximo meetup!</h1>

  <div class="w-full inline-flex justify-center mb-4">
    {% if site.metadata.subscription_link %}
      <a class="button" href="{{ site.metadata.subscription_link }}">Inscreva-se!</a>
    {% else %}
      <p class="m-0">Não é necessário inscrição para participar. Só aparecer no horário! 😉</p>
    {% endif %}
  </div>
{% endif %}

{% render "event_description", event: nearest_future_event, site: site %}

{% else %}

<h1 class="sr-only">Ruby DF</h1>

Ruby DF é o meetup de Ruby no Distrito Federal. Nosso objetivo é reunir a comunidade Ruby do DF e entorno para compartilhar conhecimento, experiências e fazer networking.

---

## Próximo evento: em breve!

Estamos preparando o próximo meetup. Fique ligado nas [nossas redes
sociais]({{ site.metadata.telegram_link }}) para mais informações. Enquanto isso, você pode conferir
um pouco sobre as [edições passadas aqui](/events).

Se quiser ajudar na organização, dê uma olhada em [como você pode contribuir](/sponsoring).

## Patrocínio

Se você ou sua empresa tem interesse em patrocinar o Ruby DF, veja [como você
pode ajudar](/sponsoring#como-você-pode-ajudar) e os [benefícios](/sponsoring#o-que-podemos-oferecer) de ser um patrocinador [aqui](/sponsoring). Se preferir, entre em
contato conosco pelo email <{{ site.metadata.email }}> para mais informações.

{% endif %}

---

## Organização

O Ruby DF é organizado por [Matheus Richard](https://twitter.com/matheusrich) e acontece por volta de uma vez por quadrimestre.
