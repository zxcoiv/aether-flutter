# AETHER — Monitoramento Ambiental via Satélite

## Objetivo da Solução

O **AETHER** é um aplicativo Flutter desenvolvido como parte da **Global Solution da FIAP**. A solução simula uma plataforma de monitoramento ambiental que utiliza dados de satélites para identificar e acompanhar eventos críticos no território brasileiro - incêndios, enchentes, desmatamentos, secas e poluição atmosférica.

O app centraliza essas informações em painéis visuais, permitindo que usuários acompanhem ocorrências ativas, consultem alertas classificados por nível de severidade e visualizem os satélites responsáveis pela coleta dos dados.

---

## Entidades gerenciadas

| Entidade | Descrição |
|---|---|
| `EnvironmentalEvent` | Evento ambiental detectado por satélite (tipo, severidade, status, área afetada) |
| `Satellite` | Satélite monitorado com informações de órbita, missão e status operacional |
| `EnvironmentalAlert` | Alerta gerado com título, nível de severidade, região e status de leitura |

---

## Telas

| Tela | Descrição |
|---|---|
| **Splash** | Tela de abertura com identidade visual do app (3 segundos) |
| **Intro** | Onboarding em 3 páginas explicando os módulos do app, com opção de pular |
| **Home** | Dashboard com estatísticas gerais, atalhos para os módulos e eventos recentes |
| **Eventos** | Lista de eventos com filtro por tipo (Incêndio, Enchente, Desmatamento, Seca, Poluição) |
| **Detalhe do Evento** | Informações completas: descrição, região, satélite, área afetada e data de detecção |
| **Satélites** | Catálogo de satélites com filtro por status (Operacional, Standby, Manutenção) |
| **Alertas** | Central de alertas com filtro por nível (Informação, Atenção, Perigo, Emergência) |

---

## Fluxo de Navegação

```
┌──────────┐
│  Splash  │ (3 seg → navega automaticamente)
└────┬─────┘
     ▼
┌──────────┐
│  Intro   │ (3 páginas de onboarding, com botão "Pular")
└────┬─────┘
     ▼
┌─────────────────────────────────────────────────────┐
│                        Home                         │
│     [Eventos]      [Satélites]      [Alertas]       │
└────┬────────────────────┬──────────────────┬────────┘
     ▼                    ▼                  ▼
┌─────────┐        ┌────────────┐     ┌──────────┐
│ Eventos │        │ Satélites  │     │ Alertas  │
└────┬────┘        └────────────┘     └──────────┘
     ▼
┌──────────────────┐
│ Detalhe do       │
│ Evento           │
└──────────────────┘
```

A navegação é feita com o **Navigator** do Flutter via `generateRoute` em `AppNavigation`. Splash e Intro usam `pushReplacementNamed`, impedindo que o usuário volte a essas telas. As demais usam `pushNamed` com `pop` para retornar. O Detalhe do Evento recebe o objeto `EnvironmentalEvent` via `arguments`.
