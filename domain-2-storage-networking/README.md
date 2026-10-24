# Lab 2 — Storage, Databases & Networking

**Status:** 🟡 Network built (Terraform in `terraform/`) · **SC-500 Domain 2** · **Cost:** pennies · **Region:** westus

## Goal
Segment a network so each tier only talks to the tier in front of it, and keep data reachable only over a private IP.

## Part A — Segmented network (done in Terraform)
- VNet `10.10.0.0/16` with `snet-web`, `snet-app`, `snet-data`.
- NSGs: Internet → web (443), web → app (443), app → data (443/1433).
- Explicit **deny at priority 4000** overrides Azure's default `AllowVnetInBound`.

## Part B — Locked-down storage (next)
1. Storage account: public network access **off**, shared key access **off**, minimum TLS 1.2.
2. **Private endpoint** in `snet-data` + private DNS zone.
3. Verify: access from the internet fails; access over the private endpoint works.

## Proof
Screenshots in `screenshots/`: NSG inbound rules, storage networking blade, failed public access.

## What I learned
- 
- 
- 

## Exam links
NSG vs. ASG vs. Azure Firewall · private endpoint vs. service endpoint · shared key vs. Entra auth for storage
