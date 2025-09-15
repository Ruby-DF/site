# Agenda Automática

Este documento explica como usar a funcionalidade de geração automática de agenda para eventos Ruby DF.

## Funcionalidades

A agenda automática calcula automaticamente os horários de cada item baseado:

1. **Abertura**: 10 minutos fixos (inicia no horário do evento)
2. **Palestras**: Duração customizável por palestra (definida nos metadados)
3. **Intervalo**: 10 minutos fixos
4. **Roda de Conversa**: Preenche o tempo restante até meio-dia (12:00)

## Como Usar

### 1. Adicionar Duração às Palestras

No arquivo do evento (ex: `src/_events/2025-01-25-quarta-edicao.md`), adicione o campo `duration` para cada palestra:

```yaml
talks:
  - title: "Nome da Palestra"
    duration: 30  # duração em minutos
    speaker:
      name: "Nome do Palestrante"
      # ... outros campos
```

### 2. Duração Padrão

Se uma palestra não tiver o campo `duration`, o sistema usará **20 minutos** como padrão.

### 3. Componentes Disponíveis

#### Agenda no Site (`timed_agenda.liquid`)
- Exibe a agenda completa na página do evento
- Inclui fotos e biografias dos palestrantes
- Integra-se perfeitamente com o design existente

#### Agenda para Exportação (`agenda_export.liquid`)
- Versão otimizada para exportação como imagem ou PDF
- Design inspirado na imagem original de referência
- Acesso via URL: `/agenda-export/{data-do-evento}/`

### 4. Como Exportar para Imagem

1. Acesse a URL de exportação: `/agenda-export/2025-01-25/`
2. Use ferramentas do browser para salvar como PDF ou capturar screenshot
3. Ou use ferramentas como `himg` (mencionado no issue) para conversão automática

## Exemplo de Cálculo

Para um evento que começa às **09:30**:

- 09:30 - 09:40: **Abertura** (10min)
- 09:40 - 10:10: **Palestra 1** (30min)
- 10:10 - 10:30: **Palestra 2** (20min)  
- 10:30 - 10:50: **Palestra 3** (20min)
- 10:50 - 11:00: **Intervalo** (10min)
- 11:00 - 12:00: **Roda de Conversa** (60min restantes)

## Implementação Técnica

### Arquivos Modificados/Criados:

- `src/_components/timed_agenda.liquid` - Componente principal da agenda
- `src/_components/agenda_export.liquid` - Versão para exportação
- `src/_layouts/agenda_export.liquid` - Layout da página de exportação
- `src/_components/event_description.liquid` - Integração com páginas de evento
- `frontend/styles/agenda-export.css` - Estilos para exportação

### Como Funciona:

1. **Cálculos de Tempo**: Usa filtros Liquid para aritmética de timestamps
2. **Flexibilidade**: Suporta qualquer número de palestras
3. **Robustez**: Valores padrão para campos opcionais
4. **Reutilização**: Componentes podem ser usados em diferentes contextos

## Vantagens

✅ **Automatização**: Elimina erro humano no cálculo de horários  
✅ **Flexibilidade**: Suporta eventos com diferentes números de palestras  
✅ **Consistência**: Design visual consistente com o site  
✅ **Exportação**: Formato otimizado para redes sociais  
✅ **Manutenibilidade**: Código reutilizável e bem documentado  

## Personalização

### Alterar Duração Padrão
Modifique a linha no componente:
```liquid
{% assign talk_duration_seconds = 20 | times: 60 %}
```

### Alterar Horário de Término
Modifique o horário "12:00" nos componentes para outro horário desejado.

### Personalizar Estilos
Edite `frontend/styles/agenda-export.css` para ajustar a aparência da versão exportável.