# stackwerk-sample-git

🇬🇧 [English version](README.md)

Ein Git-Repository, um [stackwerk](https://github.com/hopplin/stackwerk) auszuprobieren. Es enthält OpenTofu-Code für eine erfundene Firma
mit zwei Standorten, einer DMZ und einem Labor und verwendet alles, was stackwerk heute versteht.

**Nicht ausrollen.** Hosts, Adressen, Konten, Passwörter und Lizenzschlüssel sind erfunden, die Hashes in den Lock-Dateien sind Platzhalter,
und der Code lief nie gegen vCenter, NSX, Vault, Kubernetes oder Docker. Die Attributnamen folgen den Providern, soweit bekannt,
aber nichts hier wurde mit `tofu validate` geprüft. Eine Datei ist absichtlich kaputt.

## In stackwerk hinzufügen

In der Einrichtung oder unter *Einstellungen → Repositorys* trägst du

```
https://github.com/hopplin/stackwerk-sample-git.git
```

ein und wählst *HTTPS ohne Anmeldung*. Um stattdessen einen Deploy-Key zu testen, trägst du `git@github.com:hopplin/stackwerk-sample-git.git` ein und wählst
*SSH mit eigenem Schlüssel*; das braucht Schreibrecht auf die Einstellungen dieses Repositorys, nimm dafür also einen Fork.

## Aufbau

| Pfad | Inhalt |
|---|---|
| `stacks/grundlage` | die Plattform selbst, direkt als Ressourcen deklariert: Datacenter, Cluster, Hosts, Pools, Ordner, Switches, Datastores, Content Library, eine Maschine. Trägt die meisten der unten genannten Fehler. |
| `stacks/prod-nord` | 153 Maschinen, NSX-Gateway mit Firewall, Vault, Kubernetes mit Helm-Releases |
| `stacks/prod-sued` | 92 Maschinen, Vault |
| `stacks/dmz` | 18 Maschinen, NSX-Gateway mit Firewall, Docker-Container |
| `stacks/labor` | 15 Maschinen, deren Module aus einer Git-Quelle kommen, Docker-Container |
| `modules/vm-linux`, `modules/vm-windows` | die beiden Module, mit denen die Maschinen der anderen Stacks entstehen |
| `.stackwerk/profiles/modules.json` | ein Profil dieses Repositorys: Es sagt stackwerk, dass ein Aufruf der beiden Module eine Maschine ist |
| `.github/workflows/stackwerk.yml` | bittet stackwerk nach jedem Push um einen Abruf, sobald eine Variable und ein Secret gesetzt sind |

## Branches

| Branch | Unterschied zu `main` |
|---|---|
| `feature/monitoring-netz` | `prod-nord`: Das Monitoring wächst von 5 auf 8 Maschinen und zieht in ein eigenes Netz, VLAN 140 |
| `fix/dmz-auffaelligkeiten` | `dmz`: Der Provider ist festgeschrieben, die Lock-Datei ist da und das Secret hat keinen Standardwert mehr, die Auffälligkeiten sind damit weg |

Zwischen ihnen wechselst du mit dem Branch-Umschalter in der Kopfzeile von stackwerk.

## Was der Code verwendet

| Merkmal | Wo |
|---|---|
| Variablen mit Standardwerten, `terraform.tfvars` und `*.auto.tfvars` | jeder Stack; `stacks/grundlage/lager.auto.tfvars` |
| Locals, die aufeinander aufbauen, `for`-Ausdrücke, Funktionen | `stacks/grundlage/locals.tf`, `stacks/*/locals.tf` |
| `for_each` über Variablen, Locals und Mengen | überall |
| `count` | `stacks/grundlage/compute.tf` |
| `dynamic`-Blöcke | `stacks/grundlage/network.tf`, `stacks/*/firewall.tf` |
| Module aus einem Pfad und aus einer Git-Quelle | `stacks/prod-nord`, `stacks/labor` |
| Data Sources | `stacks/*/data.tf` |
| sensible Variablen und Secrets aus Vault | `stacks/*/variables.tf`, `stacks/prod-*/secrets.tf` |
| Backend, geforderte Versionen, Provider-Lock-Datei, `.opentofu-version` | jeder Stack |
| jeder Ressourcentyp des eingebauten vSphere-Profils | `stacks/grundlage` |

## Was absichtlich falsch ist

stackwerk zeigt Auffälligkeiten. Der Code enthält ihre Ursachen:

| Stack | Auffälligkeit |
|---|---|
| `grundlage` | die sensible Variable `esxi_root_password` hat einen Standardwert im Code |
| `grundlage` | die sensible Variable `license_key` wird in `secrets.auto.tfvars` gesetzt |
| `grundlage` | der Provider `vsphere` hat keine Versionsangabe |
| `grundlage` | der Provider `random` wird verwendet, steht aber nicht in `required_providers` |
| `grundlage` | die Provider-Lock-Datei fehlt |
| `grundlage` | die Variable `ntp_servers` ist deklariert, wird aber nie verwendet |
| `grundlage` | `vsphere_host.spare` bekommt sein `count` aus einer Variable ohne Wert, der Code allein entscheidet also nicht, wie viele es sind |
| `grundlage` | in `kaputt.tf` fehlt eine schließende Klammer, die Datei ist nicht lesbar |
| `prod-sued` | die Variable `ntp_servers` ist deklariert, wird aber nie verwendet |
| `dmz` | die sensible Variable `domain_join_password` hat einen Standardwert im Code |
| `dmz` | die Lock-Datei fehlt |

stackwerk zeigt den Wert eines Secrets nie: Öffne `stacks/grundlage/variables.tf` in der Quellcode-Ansicht, der Standardwert ist dort verdeckt.

Weitere Fehler stecken im Code für Regeln, die stackwerk noch nicht prüft: Maschinen ohne `backup`-, `verantwortlich`- oder `kostenstelle`-Tag,
Vorlagen außerhalb des Supports (`tpl-ubuntu-1804`, `tpl-win-2012r2`), ein nur lose festgeschriebener Provider (`>= 2.0`), eine OpenTofu-Version,
die zwischen Stacks abweicht, und ein Container-Image mit dem Tag `latest`.
