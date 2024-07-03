# Ruby DF

Esse é o repositório do site da comunidade Ruby DF. O site é construído com
[Bridgetown](https://www.bridgetownrb.com/), um framework fullstack em Ruby.

## Pré-requisitos

- [GCC](https://gcc.gnu.org/install/)
- [Make](https://www.gnu.org/software/make/)
- [Ruby](https://www.ruby-lang.org/en/downloads/)
  - `>= 2.7`
- [Bridgetown Gem](https://rubygems.org/gems/bridgetown)
  - `gem install bridgetown -N`
- [Node](https://nodejs.org)
  - `>= 12`
- [Yarn](https://yarnpkg.com)

## Instalação

```sh
cd bridgetown-site-folder
bundle install && yarn install
```

> Mais informações: [Bridgetown Getting Started Documentation](https://www.bridgetownrb.com/docs/).

## Desenvolvimento

Para iniciar o site em modo de desenvolvimento, execute `bin/bridgetown start` e acesse [localhost:4000](https://localhost:4000/).

### Comandos úteis

```sh
# running locally
bin/bridgetown start

# build & deploy to production
bin/bridgetown deploy

# load the site up within a Ruby console (IRB)
bin/bridgetown console
```

> Mais informações: [Bridgetown CLI Documentation](https://www.bridgetownrb.com/docs/command-line-usage)
