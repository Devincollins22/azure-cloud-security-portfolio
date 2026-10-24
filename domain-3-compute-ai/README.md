# Lab 3 — Compute & AI

**Status:** ⬜ Not started · **SC-500 Domain 3** · **Cost:** low — delete the same day · **Region:** westus

## Goal
Run a VM with no exposed management ports and hardened boot/disk settings; add AI guardrails if the subscription allows AI models.

## Part A — Hardened VM
1. Small Linux VM with **no public IP**, trusted launch (**secure boot + vTPM**), encryption at host or disk encryption.
2. NSG with **no** inbound RDP/SSH.
3. If Defender for Servers is available: enable **just-in-time (JIT)** access and request access once.

## Part B — AI security (if available on Azure for Students)
1. Check whether Azure OpenAI / Foundry models can be deployed in an allowed region.
2. If yes: deploy a model with **keyless (Entra) auth**, content filters, and Prompt Shields.
3. If no: document the design and study from Learn.

## Proof / What I learned / Exam links
Trusted launch · JIT VM access · Azure Bastion · Defender for Servers · Prompt Shields · Defender for AI
