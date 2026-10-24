# Roadmap: SC-500 + Domain Labs

**Goal:** Pass SC-500 (early December 2026) with one hands-on lab per exam domain.
**Subscription:** Azure for Students (Canisius) · **Region:** `westus` (subscription policy allows only belgiumcentral, norwayeast, denmarkeast, westus, francecentral)

## Weekly plan

| Week | Study (Microsoft Learn) | Lab |
|---|---|---|
| Oct 26 | Domain 1: Entra, Key Vault, governance | **Lab 1** (weekend) |
| Nov 2 | Domain 2: storage, databases, networking | **Lab 2** (weekend) |
| Nov 9 | Domain 3: VMs, containers, App Service | **Lab 3** (weekend) |
| Nov 16 | Domain 3: AI security | — |
| Nov 23 | Domain 4: Defender for Cloud, Sentinel, Security Copilot | **Lab 4** + **practice checkpoint** |
| Nov 30 | Review weak areas, timed practice | **Exam** |

**Checkpoint (Nov 23):** practice score ~75%+ → keep the exam date. Well below → reschedule to January.

## Weekly rhythm
- **Weekdays (~1 hr):** one Learn module; write one line per feature: *what it does + when to use it*.
- **Weekend:** finish the week's modules, run the lab, take a 10-question quiz.

## Labs

| Lab | Folder | Proves |
|---|---|---|
| 1 | [domain-1-identity-governance](domain-1-identity-governance) | Key Vault RBAC, soft delete, purge protection, Azure Policy Deny, resource locks |
| 2 | [domain-2-storage-networking](domain-2-storage-networking) | Three-tier VNet + NSGs, locked-down storage behind a private endpoint |
| 3 | [domain-3-compute-ai](domain-3-compute-ai) | Hardened VM (no public IP, trusted launch, encryption); AI guardrails if available |
| 4 | [domain-4-posture-monitoring](domain-4-posture-monitoring) | Defender for Cloud secure score, recommendations, compliance mapping |

## Rules
- Never commit secrets, keys, tenant IDs, or subscription IDs. Blur them in screenshots.
- Tear down every lab the same day (`terraform destroy` or `az group delete`).
- PIM and Conditional Access can't be done hands-on (school tenant blocks admin) — study them from Learn.
