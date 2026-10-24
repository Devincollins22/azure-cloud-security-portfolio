# Lab 1 — Identity, Access & Governance

**Status:** ⬜ Not started · **SC-500 Domain 1** · **Cost:** ~free · **Region:** westus

## Goal
Prove three controls actually *block* bad actions: secrets can't be permanently destroyed, insecure resources can't be created, and critical resources can't be deleted.

## Steps
1. **Resource group:** `rg-lab1-identity` in `westus`.
2. **Key Vault (RBAC mode, purge protection on).** Assign yourself **Key Vault Secrets Officer**.
3. **Soft delete:** create a secret → delete it → recover it.
4. **Purge protection:** try to purge a deleted secret → ❌ blocked.
5. **Azure Policy (Deny):** assign built-in *Storage accounts should disable public network access* with effect **Deny** on the resource group → try to create a public storage account → ❌ blocked.
6. **Resource lock:** add a **CanNotDelete** lock to the vault → try to delete it → ❌ blocked.
7. **Cleanup:** remove the lock and policy assignment, then delete the resource group.

## Proof
Screenshots of each ❌ blocked message in `screenshots/` (blur IDs).

## What I learned
- 
- 
- 

## Exam links
RBAC vs. access policies · soft delete vs. purge protection · Policy Deny vs. Audit · CanNotDelete vs. ReadOnly locks
