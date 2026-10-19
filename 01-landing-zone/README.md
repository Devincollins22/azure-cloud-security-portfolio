# 01 — Secure Azure Landing Zone

A security-hardened Azure environment deployed entirely as Terraform, built against
the CIS Microsoft Azure Foundations Benchmark. Deploys from an empty subscription
with a single `terraform apply`.

**Status:** in progress
**Stack:** Terraform, Azure (VNet, NSG, Storage, Key Vault, Policy), Microsoft Defender for Cloud

---

## Architecture

Single-region environment with three-tier network isolation:

| Subnet | Purpose | Inbound allowed from |
|---|---|---|
| `snet-web` | Public-facing tier | Internet (443 only) |
| `snet-app` | Application tier | `snet-web` only |
| `snet-data` | Data tier | `snet-app` only |

No subnet accepts inbound traffic from the internet except `snet-web` on 443.
Storage and Key Vault are reachable only through private endpoints.

---

## Controls implemented

| # | Control | Why it matters | CIS ref |
|---|---|---|---|
| 1 | NSGs with default-deny, tier-to-tier rules only | Limits lateral movement after a single host is compromised | 6.x |
| 2 | Storage: shared key access disabled | Account keys never expire and are not traceable to a person | 3.x |
| 3 | Storage: `min_tls_version = TLS1_2`, HTTPS-only | Blocks downgrade to weak transport encryption | 3.x |
| 4 | Storage: public blob access disabled | Prevents accidental public data exposure | 3.x |
| 5 | Key Vault with RBAC (not access policies) | Grants access to one secret, not the whole vault | 8.x |
| 6 | Key Vault soft-delete + purge protection | Secrets survive accidental or malicious deletion | 8.x |
| 7 | VM system-assigned managed identity reads Key Vault | No credentials stored in code or config | 8.x |
| 8 | Custom Azure Policy denying public storage accounts | Prevents the misconfiguration instead of detecting it later | 5.x |
| 9 | Resource locks on Key Vault and storage | Blocks accidental deletion of stateful resources | — |
| 10 | Defender for Cloud enabled, CIS standard assigned | Continuous compliance scoring | 2.x |

---

## Build phases

Each phase is one commit.

- [ ] **Phase 1 — Network foundation**
  Resource group, VNet, three subnets, NSGs with default-deny and tier rules.
  *Verify:* a VM in `snet-data` cannot be reached from the internet.

- [ ] **Phase 2 — Storage hardening**
  Storage account with shared key access disabled, TLS 1.2 minimum, public access off,
  private endpoint into `snet-data`.
  *Verify:* access with an account key fails; access with an Entra identity succeeds.

- [ ] **Phase 3 — Secrets and identity**
  Key Vault with RBAC authorization, soft-delete and purge protection. One VM with a
  system-assigned managed identity granted `Key Vault Secrets User` on a single secret.
  *Verify:* the VM reads its secret with no credentials anywhere in the Terraform.

- [ ] **Phase 4 — Governance**
  Custom Azure Policy denying storage accounts with public network access, assigned at
  subscription scope. `CanNotDelete` locks on Key Vault and storage.
  *Verify:* deploying a non-compliant storage account is blocked, not just flagged.

- [ ] **Phase 5 — Posture and compliance**
  Defender for Cloud enabled, CIS Microsoft Azure Foundations Benchmark assigned.
  Record the starting secure score, remediate the top findings, record the final score.
  *Verify:* document before/after numbers in this README.

---

## Deploying

```
terraform init
terraform plan
terraform apply
```

Destroy when not in use — `terraform destroy` — to stay inside the student credit.

---

## Results

_Secure score before: TBD_
_Secure score after: TBD_
_CIS controls passing: TBD_
