---
layout: default
---

<% event = collections.events.resources.select { |e| e.date >= site.time }.min_by(&:date) %>

<% if event %>

<% days_until_event = (event.date.to_date - site.time.to_date).to_i %>

<% if days_until_event == 0 %>
  <h1 class="mb-8">🎉 É hoje! Aguardamos você!</h1>
<% elsif days_until_event == 1 %>
  <h1 class="mb-8">🎉 É amanhã! Aguardamos você!</h1>
<% else %>
  <h1 class="mb-8">🎉 Faltam <%= days_until_event %> dias para o próximo meetup!</h1>

  <div class="w-full inline-flex justify-center mb-4">
    <% if event.subscription_link %>
      <div class="flex flex-col gap-2 items-center">
      <p class="m-0">As vagas são limitadas. Garanta a sua!</p>

      <a class="button w-fit" href="<%= event.subscription_link %>">Inscreva-se!</a>
      </div>
    <% else %>
      <p class="m-0">Não é necessário se increver para participar. Só chegar no horário! 😉</p>
    <% end %>
  </div>
<% end %>

<%= render "event_description", event: event, site: site %>

<% else %>

<h1 class="sr-only">Ruby DF</h1>

Ruby DF é o meetup de Ruby no Distrito Federal. Nosso objetivo é reunir a comunidade Ruby do DF e entorno para compartilhar conhecimento, experiências e fazer networking.

Participe do Ruby DF se você:

- é novo em Ruby e quer aprender mais
- trabalha com Ruby e quer aprimorar seus conhecimentos
- quer ouvir palestras interessantes sobre Ruby e desenvolvimento de software em geral
- quer conhecer outras pessoas que também gostam de Ruby

---

## Próximo evento: em breve!

Estamos preparando o próximo meetup. Fique ligado nas [nossas redes
sociais](<%= site.metadata.telegram_link %>) para mais informações. Enquanto isso, você pode conferir
um pouco sobre as [edições passadas aqui](/events).

<% if site.metadata.cfp_link %>
  <aside class="note">
    <p>Tem interesse em palestrar? <a class="font-bold" href="<%= site.metadata.cfp_link %>" target="_blank">Envie seu talk!</a></p>
  </aside>
<% end %>

Se quiser ajudar na organização, há várias formas de contribuir.

<a class="mx-auto block w-fit button" href="<%= relative_url("/sponsoring") %>">Como posso ajudar?</a>

## Patrocínio

Se você ou sua empresa tem interesse em patrocinar o Ruby DF, veja [como você
pode ajudar](/sponsoring#como-você-pode-ajudar) e os [benefícios](/sponsoring#o-que-podemos-oferecer) de ser um patrocinador [aqui](/sponsoring). Se preferir, entre em
contato conosco pelo email <<%= site.metadata.email %>> para mais informações.

<% end %>

---

## Organização

O Ruby DF é organizado por [Matheus Richard](https://twitter.com/matheusrich) e acontece por volta de uma vez por bimestre.
