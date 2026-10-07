# stackwerk-sample-git

🇩🇪 [Deutsche Fassung](README.de.md)

A Git repository to try [stackwerk](https://github.com/hopplin/stackwerk) with. It holds OpenTofu code for a fictitious company
with two sites, a DMZ and a lab, and it uses everything stackwerk understands today.

**Do not apply it.** Hosts, addresses, accounts, passwords and license keys are invented, the hashes in the lock files are placeholders,
and the code was never run against vCenter, NSX, Vault, Kubernetes or Docker. The attribute names follow the providers as far as known,
but nothing here was validated with `tofu validate`. One file is broken on purpose.

## Adding it to stackwerk

In the setup, or under *Settings → Repositories*, enter

```
https://github.com/hopplin/stackwerk-sample-git.git
```

and choose *HTTPS without sign-in*. To try a deploy key instead, enter `git@github.com:hopplin/stackwerk-sample-git.git` and choose *SSH with a key of its own*;
that needs write access to the settings of this repository, so use a fork.

## Layout

| Path | Content |
|---|---|
| `stacks/grundlage` | the platform itself, declared directly as resources: datacenter, clusters, hosts, pools, folders, switches, datastores, content library, one machine. Carries most of the faults listed below. |
| `stacks/prod-nord` | 153 machines, NSX gateway with firewall, Vault, Kubernetes with Helm releases |
| `stacks/prod-sued` | 92 machines, Vault |
| `stacks/dmz` | 18 machines, NSX gateway with firewall, Docker containers |
| `stacks/labor` | 15 machines whose modules come from a Git source, Docker containers |
| `modules/vm-linux`, `modules/vm-windows` | the two modules the machines of the other stacks are created with |
| `.stackwerk/profiles/modules.json` | a profile of this repository: it tells stackwerk that a call of the two modules is a machine |
| `.github/workflows/stackwerk.yml` | asks stackwerk for a fetch after every push, once a variable and a secret are set |

## Branches

| Branch | Differs from `main` |
|---|---|
| `feature/monitoring-netz` | `prod-nord`: monitoring grows from 5 to 8 machines and moves into a network of its own, VLAN 140 |
| `fix/dmz-auffaelligkeiten` | `dmz`: the provider is pinned, the lock file exists and the secret has no default any more, so its findings are gone |

Switch between them with the branch picker in the header of stackwerk.

## What the code uses

| Feature | Where |
|---|---|
| variables with defaults, `terraform.tfvars` and `*.auto.tfvars` | every stack; `stacks/grundlage/lager.auto.tfvars` |
| locals that build on each other, `for` expressions, functions | `stacks/grundlage/locals.tf`, `stacks/*/locals.tf` |
| `for_each` over variables, locals and sets | everywhere |
| `count` | `stacks/grundlage/compute.tf` |
| `dynamic` blocks | `stacks/grundlage/network.tf`, `stacks/*/firewall.tf` |
| modules from a path and from a Git source | `stacks/prod-nord`, `stacks/labor` |
| data sources | `stacks/*/data.tf` |
| sensitive variables and secrets from Vault | `stacks/*/variables.tf`, `stacks/prod-*/secrets.tf` |
| backend, required versions, provider lock file, `.opentofu-version` | every stack |
| every resource type of the built-in vSphere profile | `stacks/grundlage` |

## What is wrong on purpose

stackwerk shows findings. The code contains their causes:

| Stack | Finding |
|---|---|
| `grundlage` | the sensitive variable `esxi_root_password` has a default value in the code |
| `grundlage` | the sensitive variable `license_key` is assigned in `secrets.auto.tfvars` |
| `grundlage` | the provider `vsphere` has no version constraint |
| `grundlage` | the provider `random` is used but not declared in `required_providers` |
| `grundlage` | the provider lock file is missing |
| `grundlage` | variable `ntp_servers` is declared but never used |
| `grundlage` | `vsphere_host.spare` gets its `count` from a variable without a value, so the code alone does not decide how many there are |
| `grundlage` | `kaputt.tf` lacks a closing brace and cannot be read |
| `prod-sued` | variable `ntp_servers` is declared but never used |
| `dmz` | the sensitive variable `domain_join_password` has a default value in the code |
| `dmz` | the lock file is missing |

stackwerk never shows the value of a secret: open `stacks/grundlage/variables.tf` in the source view and the default is masked.

Further faults are in the code for rules stackwerk does not check yet: machines without a `backup`, `verantwortlich` or `kostenstelle` tag,
templates that are out of support (`tpl-ubuntu-1804`, `tpl-win-2012r2`), a provider that is only loosely pinned (`>= 2.0`), an OpenTofu version
that differs between stacks, and a container image with the tag `latest`.
