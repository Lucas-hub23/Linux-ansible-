# Linux - Practicum Week 5- Eindopdracht

Voor deze eindopdracht realiseer je lokaal je eigen omgeving, bij voorkeur op **Azure**, maar een eigen inrichting mag ook.


**Belangrijk**: Bij elk commando dat je uitvoert om een resultaat of antwoord te verkrijgen, is het verplicht om een screenshot te maken van je scherm als bewijs van voortgang. Deze afbeeldingen tonen aan dat de opdracht correct is uitgevoerd en helpen je ook om je resultaten bij te houden.

Verder is het essentieel om al je voortgang en resultaten vast te leggen in een private Git-repository (Bijvoorbeeld op GitHub). Hiermee leer je niet alleen werken met versiebeheer, maar zorg je er ook voor dat alle stappen van je werk overzichtelijk en reproduceerbaar zijn.

Bij voorkeur gebruik je MarkDown, zodat het document ook nog enigszins oogt. Via deze link vind je meer informatie over Markdown op github:
[Basic writing and formatting syntax - GitHub Docs](https://docs.github.com/en/github/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax)

Een manier om gemakkelijk met markdown en git te werken is door in Visual Studio Code(VS Code) een plug-in voor Markdown the instaleren, en vanuit VS Code commits te maken en deze te pushen naar je eigen private Git Repo.

## Inleveren
Zowel de tekstdocumenten als de geproduceerde scripts houden jullie bij op zowel jullie Git repo. De tekstdocumenten, Scripts en opname leveren jullie ook in op de Elo omgeving.

1. Het script voor automatische registratie en monitoring.
2. Documentatie over de implementatiestappen inclusief screenshots van de werking van je oplossing.
3. Een opname waar jullie de werkende omgeving demonstreren.


## Opdrachtbeschrijving

### 1. Hoofdserver inrichten
- Zet een hoofdserver op met de volgende functionaliteiten:
  - **Centrale Log en Monitoring service**
  - **Orchestration** met **Ansible**

- **Ansible-configuratie:**
  - Installeer *Ansible* op de hoofdserver.
  - Zorg ervoor dat de hoofdserver zichzelf kan **updaten** via Ansible (zowel het OS als Ansible zelf).

> Hiervoor kun je je Monitor server uit weekopdracht 4 voor gebruiken.

> Overleg eventueel met de docent over de te gebruiken logservice en monitoringtool als je andere tooling wilt gebruiken dan uit weekopdracht 3.


### 2. Twee extra servers opzetten
- Realiseer twee servers met de volgende functies:
  - **Server 1:** Installeer en configureer **WordPress**.
  - **Server 2:** Installeer en configureer **Docker**.


- **Inrichting via Ansible:**
  - De volledige inrichting van de servers (WordPress, Docker, monitoringtools) moet via Ansible worden uitgevoerd.
  - Ook de monitoringclient op deze servers moet via Ansible worden geïnstalleerd en geconfigureerd zodat deze door de _hoofdserver_ gemonitored kunnen worden.


## Eisen en richtlijnen

### 1. Git-repository
- Houd alle scripts en voortgang bij in een **Git-repository**.
- **Eigen werk verplicht:**
  - Alle scripts moeten door jullie worden geschreven.
  - Indien je scripts gebruikt die je online hebt gevonden:
    - Geef de bron duidelijk aan.
    - Zorg dat je het script volledig kunt uitleggen.
  - **Plagiaat wordt streng bestraft.** Bij constatering wordt de opdracht niet beoordeeld en wordt melding gemaakt bij de examencommissie.



## Verwachte resultaten
- Een volledig ingerichte hoofdserver met:
  - Een Log en Monitoring service.
<img width="1244" height="298" alt="image" src="https://github.com/user-attachments/assets/680f7c93-d41b-4363-8eb2-ee6eb09ff009" />
<img width="622" height="75" alt="image" src="https://github.com/user-attachments/assets/24e4f945-6bb4-45e8-b71a-07f73396e663" />
<img width="646" height="101" alt="image" src="https://github.com/user-attachments/assets/50beb0e2-8e16-4069-90f0-847def1be9b3" />

Ansible configureerd rsyslog. hier is te zien hoe de logger commans terechtkomen op de centrale logserver. Dit is de logging

<img width="1864" height="471" alt="image" src="https://github.com/user-attachments/assets/ed4ef38f-2f73-48fd-a20f-c060d897c6e3" />

Ansible configureerd netdata, Ubuntu-LD als server, runner en test als clients. Netdata monitort de metrix en dergelijke; monitoring

  - Ansible-configuratie voor self-updates.

er is een Ansible playboek dat alle nodige upates uitvoert /Linux-ansible-/Ansible/playbooks/update_orch_server.yml

- Twee extra servers met:
  - WordPress geïnstalleerd en geconfigureerd.
  - Docker geïnstalleerd en geconfigureerd.

<img width="1905" height="106" alt="image" src="https://github.com/user-attachments/assets/ccf4d1f6-9eb7-4d7c-a7b1-b622a114e75f" />
<img width="1902" height="107" alt="image" src="https://github.com/user-attachments/assets/01d7109d-282d-4552-963d-9fba40e95345" />

Wordpress werkt op allebei de servers. db is aangemaakt, gebruikers zijn aangemaakt, rechten zijn goed ingesteld. 


<img width="1868" height="992" alt="image" src="https://github.com/user-attachments/assets/fb4adc16-9e46-4fa0-9d74-66a81ac6e70e" />


<img width="521" height="86" alt="image" src="https://github.com/user-attachments/assets/b809ebca-a4c6-4b36-80b8-35013ae61e11" />
<img width="499" height="89" alt="image" src="https://github.com/user-attachments/assets/66526e85-5f05-4499-a0bc-e06ceb242ee7" />



- De logging/monitoring data van alle servers worden naar de hoofdserver verstuurd.

Dit gebeurt via netdata en rsyslog

- Een bijgewerkte en complete Git-repository.
- Een opname waar jullie de werkende omgeving demonstreren.


