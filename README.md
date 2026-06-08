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

## Telas (Screenshots)
<img width="1600" height="787" alt="image" src="https://github.com/user-attachments/assets/fe2ec43a-222b-44cd-a419-56e642be5af4" />
<img width="1600" height="781" alt="image" src="https://github.com/user-attachments/assets/c72f9e95-5f86-42f0-89d2-9fe059c5f474" />
<img width="1600" height="780" alt="image" src="https://github.com/user-attachments/assets/71752a72-db88-4915-a359-5476dd3fef34" />
<img width="1600" height="783" alt="image" src="https://github.com/user-attachments/assets/e53ae087-52d6-4cd6-826d-bae02ecad382" />
<img width="1600" height="775" alt="image" src="https://github.com/user-attachments/assets/2d7680ef-6424-4990-83e5-c38c1c6c56e9" />
<img width="1600" height="777" alt="image" src="https://github.com/user-attachments/assets/f4b62178-af4b-4b2e-ba09-9070233251ea" />

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
