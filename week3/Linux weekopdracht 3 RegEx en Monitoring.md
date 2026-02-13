
# Linux - Practicum Week 3


In dit practicum gaan we werken aan de basisvaardigheden voor het gebruik van Linux (Unix) en leren we enkele essentiële systeembeheertaken uitvoeren. De opdracht richt zich op het vertrouwd raken met de kernprincipes en het zelfstandig kunnen uitvoeren van beheeractiviteiten binnen een Linux-omgeving. Dit omvat onder andere het werken met de terminal, navigeren door het bestandssysteem, en het uitvoeren van basiscommando’s om informatie op te vragen en systemen te beheren.

De onderdelen van dit practicum omvatten:

1. RegEx: Hierbij leer je de basisvaardigheden om effectief met regex (reguliere expressies) te werken. Dit omvat technieken voor patroonherkenning, het extraheren van gegevens, en het verfijnen van zoekopdrachten binnen teksten.

2. Monitoring en Logging: Hierbij leer je de kernvaardigheden voor monitoring en logging. Dit omvat het opzetten van tools voor het bijhouden van systeemstatus, het verzamelen van loggegevens en het inzichtelijk maken van prestaties binnen een Linux-omgeving.

**Belangrijk**: Bij elk commando dat je uitvoert om een resultaat of antwoord te verkrijgen, is het verplicht om een screenshot te maken van je scherm als bewijs van voortgang. Deze afbeeldingen tonen aan dat de opdracht correct is uitgevoerd en helpen je ook om je resultaten bij te houden.

Verder is het essentieel om al je voortgang en resultaten vast te leggen in een private Git-repository(Bijvoorbeeld op GitHub). Hiermee leer je niet alleen werken met versiebeheer, maar zorg je er ook voor dat alle stappen van je werk overzichtelijk en reproduceerbaar zijn.

Bij voorkeur gebruik je MarkDown, zodat het document ook nog enigszins oogt. Via deze link vind je meer informatie over Markdown op github:
[Basic writing and formatting syntax - GitHub Docs](https://docs.github.com/en/github/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax)

Een manier om gemakkelijk met markdown en git te werken is door in Visual Studio Code(VS Code) een plug-in voor Markdown the instaleren, en vanuit VS Code commits te maken en deze te pushen naar je eigen private Git Repo.

## Inleveren
Zowel de tekstdocumenten als de geproduceerde scripts houden jullie bij op zowel jullie Git repo. De tekstdocumenten en Scripts leveren jullie ook in op de Elo omgeving.

# Opdracht 1: RegEx

In de file `apache-access-log.txt` vind je een access-log.
Schrijf een RegEx die e-mailadressen herkent van het bedrijf “Shaw”. Dit bedrijf is zowel
onder de TLD `.com` als `.net` geregistreerd.

De basisconventies van het Shaw-bedrijf volgen de e-mailnaamgeving van RFC [5322](https://datatracker.ietf.org/doc/html/rfc5322#section-3.4.1).
Daarnaast hanteren ze de volgende naamgevingssystematiek:
- Generieke opbouw van een e-mailadres bij Shaw is: `<mailnaam>@shaw.com` of `<mailnaam>@shaw.net`
- Voor de `<mailnaam>` geldt:
  - Minimaal 2 karakters (karakter = cijfer, letter, of speciale tekens), maximaal 99 karakters
  - De laatste positie bevat ofwel een letter (“a” t/m “z”, “A” t/m “Z”) of een cijfer (“0” t/m “9”)
  - Op andere posities zijn geen cijfers toegestaan; alleen letters of de speciale tekens `.`, `_`, en `-`
  - Andere speciale tekens zijn geheel niet toegestaan

Je kunt de regex als volgt controleren:

```bash
grep -E -o "<YOUR_REGEX>" apache-access-log.txt
```

# Opdracht 2: Monitoring en Logging

## 2 a) Setup van een Monitoring/Logging Server

Zet een Linux server op die dient als een Monitoring/Logging server.

Als logging/monitoring tools kun je de volgende opties gebruiken:
- Syslog
- Netdata
- Prometheus + graphana
- (Andere tools zijn toegestaan in overleg met de docent)


> Zorg dat je per optie uit kunt leggen hoe deze zou werken en wat de voor en nadelen zouden zijn aan het gebruik van de optie. Leg ook het verschil tussen logging en monitoring uit.

Syslog is lichtgewicht en komt samen met zowat elke linux distributie. Het heeft geen visualisatie en is minimaal. geen alerting of verdere dataanalyse. 
Netdata heeft al wel visualisatie, maar nog geen log aggregatie, maar nog niet centraal geaggregeerd
Prometheus + graphana is het complete plaatje, het is alleen wel lastiger te configuren. het zijn twee losse componenten die opzich geconfigureerd moeten worden en daarna aan elkaar gekoppeld.
Het verschil tussen logging en monitoren, is bij logging is het alleen het vastleggen van logs. Bij monitoring is het de logs verwerken en daadwerkelijk monitoren/in de gaten houden. Voorbeeld: cpu van vm word 100% gebruikt is de log, de melding die op basis van deze log wordt gemaakt in een dashboard of iets dergelijks is de monitoring.

## 2 b) Setup van een Server voor Monitoring

Zet een tweede Linux server op (of herbruik de server die je al had voor weken 1 en 2) die door de monitorserver uit opdracht 2 a) gemonitord zal worden.
> Deze server moet dus logging data kunnen verzenden naar de monitoring server van 2 a).

<img width="2551" height="448" alt="image" src="https://github.com/user-attachments/assets/d63a5566-193d-4dca-9aa4-f886cb84355c" />
dit command gebruiken we om netdata te installeren. het is een bash script dat alle benodigde dependencies installeert. 
wget -O /tmp/netdata-kickstart.sh https://get.netdata.cloud/kickstart.sh && sh /tmp/netdata-kickstart.sh
<img width="897" height="428" alt="image" src="https://github.com/user-attachments/assets/40f85b86-71df-4252-bdee-5784de829b75" />
<img width="1848" height="984" alt="image" src="https://github.com/user-attachments/assets/c915dd0f-4f0c-42b3-a09f-c68a617764b9" />
op deze afbeelding zie je de logs mooi verzameld in netdata
<img width="1488" height="95" alt="image" src="https://github.com/user-attachments/assets/646ce4b7-f331-4208-a835-5ee6de4f21b1" />



## 2 c) Installatie van een Webserver

Installeer op de server van 2 b) een webserver (zoals Apache of NGINX) om bijvoorbeeld een WordPress applicatie op te hosten. De logs van deze applicaties dienen te worden verzameld door de logserver. Deze verzamelde logs moeten inzichtelijk worden gemaakt in de monitoring stack.
> Als anternatief zouden jullie een Flask webapp (zoals jullie in jaar 1 gebouwd hebben) of een bestaande opensource webapp van de [GitHub awesome-selfhosted lijst](https://github.com/awesome-selfhosted/awesome-selfhosted) kunnen hosten

<img width="599" height="168" alt="image" src="https://github.com/user-attachments/assets/4ae154f4-cf40-4d48-965d-9787a9768cff" />
<img width="631" height="232" alt="image" src="https://github.com/user-attachments/assets/e31573f2-06e8-4efd-9f5f-94cdd33acee1" />
voor het deployen van wordpress op de vm maken wij gebruik van een ansible script dat door lucas zelf al een keer is geschreven. we lopen hier wellicht een beetje op de stappen vooruit, maar ik heb lijkt me omstrijdig om wordpress handmatig te installeren en configureren. de scripts die hiervoor gebruikt worden staan ook op dit github account, de repo staat open en heet proxmox-ansible. 
<img width="1885" height="197" alt="image" src="https://github.com/user-attachments/assets/8973eafd-edd9-41d1-928e-45f27c346345" />
op screenshot hierboven is te zien hoe we de client kunnen bereiken met een -m ping. we kunnen nu de scripts runnen en hiermee wordpress installeren en configureren. de monitoring nemen we in we in opdracht 4 mee, dit doe ik nu nog handmatig. 

ansible installatie:
$ sudo apt update
$ sudo apt install software-properties-common
$ sudo add-apt-repository --yes --update ppa:ansible/ansible
$ sudo apt install ansible
<img width="818" height="172" alt="image" src="https://github.com/user-attachments/assets/0e001b1a-0d62-4ffa-89af-d62593f9e165" />
<img width="1889" height="76" alt="image" src="https://github.com/user-attachments/assets/8b05b716-2af3-4f8b-b016-4c826f5b8a88" />
ansible installeert wordpress in de webroot die geserveerd wordt door apache2. hier zien we dat alle tasks succesvol zijn doorlopen. zie playbooks/roles/wordpress/tasks/main.yml voor geinstalleerde deps. 


## 2 d) Hardening van de Webserver

Zorg voor een hardening-script dat de Webserver van 2 b/c) beter beveiligt dan de standaardinstellingen. Zoek op wat system hardening betekend en pas een hardening techniek toe. Leg uit hoe je dit gedaan heb en laat hier zoals altijd screenshots van zien.





