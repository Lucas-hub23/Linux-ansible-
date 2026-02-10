# Linux - Practicum week 1

In dit practicum gaan we werken aan de basisvaardigheden voor het gebruik van Linux (Unix) en leren we enkele essentiële systeembeheertaken uitvoeren. De opdracht richt zich op het vertrouwd raken met de kernprincipes en het zelfstandig kunnen uitvoeren van beheeractiviteiten binnen een Linux-omgeving. Dit omvat onder andere het werken met de terminal, navigeren door het bestandssysteem, en het uitvoeren van basiscommando’s om informatie op te vragen en systemen te beheren.

De onderdelen van dit practicum omvatten:

1. Basisvaardigheden in Linux (Unix): Hierbij leer je de kernvaardigheden om effectief met Linux (Unix) om te gaan. Dit omvat commando’s voor navigatie, bestandbeheer, en het aanpassen van gebruikersinstellingen.

2. Systeembeheer op Linux (Unix): Je voert enkele eenvoudige systeembeheeractiviteiten uit, zoals het beheren van processen, gebruikersrechten, en systeeminformatie. Dit onderdeel biedt je een fundament voor het beheren van een Linux-systeem.

**Belangrijk**: Bij elk commando dat je uitvoert om een resultaat of antwoord te verkrijgen, is het verplicht om een screenshot te maken van je scherm als bewijs van voortgang. Deze afbeeldingen tonen aan dat de opdracht correct is uitgevoerd en helpen je ook om je resultaten bij te houden.

Verder is het essentieel om al je voortgang en resultaten vast te leggen in een private Git-repository(Bijvoorbeeld op GitHub). Hiermee leer je niet alleen werken met versiebeheer, maar zorg je er ook voor dat alle stappen van je werk overzichtelijk en reproduceerbaar zijn.

Bij voorkeur gebruik je MarkDown, zodat het document ook nog enigszins oogt. Via deze link vind je meer informatie over Markdown op github:
[Basic writing and formatting syntax - GitHub Docs](https://docs.github.com/en/github/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax)

Een manier om gemakkelijk met markdown en git te werken is door in Visual Studio Code(VS Code) een plug-in voor Markdown the instaleren, en vanuit VS Code commits te maken en deze te pushen naar je eigen private Git Repo.


## Inleveren
Zowel de tekstdocumenten als de geproduceerde scripts houden jullie bij op zowel jullie Git repo. De tekstdocumenten en Scripts leveren jullie ook in op de Elo omgeving.

# Opdracht 1 - Basis commando's

## 1 a) Listing:
Met welk commando kun je alle `.java` files op het systeem tonen die voldoen aan de volgende voorwaarden:
1. ze zijn de afgelopen week aangepast
2. ze bevatten de string "Main"

<img width="1885" height="97" alt="image" src="https://github.com/user-attachments/assets/4e4174a0-a5f7-4b33-8396-4257e8831aae" />


## 1 b) Links:
Wat is het verschil tussen een symbolische link en een harde link?\
*Tip*: Wat gebeurt er in beide gevallen als je het doelbestand ('target') van de link verplaatst of verwijdert?

In Linux is een harde link eigenlijk gewoon een extra naam voor hetzelfde bestand (hetzelfde inode). Daardoor blijft de harde link gewoon werken als het oorspronkelijke bestand wordt verplaatst of verwijderd, zolang er maar minstens één harde link naar dat inode bestaat. Het bestand wordt pas echt van de schijf verwijderd wanneer alle harde links weg zijn. Een harde link kan niet over verschillende filesystems heen en meestal ook niet naar directories verwijzen.

Een symbolische link is daarentegen een apart bestand dat alleen het pad naar het doelbestand bevat, vergelijkbaar met een snelkoppeling. Als het doelbestand wordt verplaatst of verwijderd, raakt de symbolische link kapot omdat het pad niet meer klopt. Symbolische links kunnen wel naar directories wijzen en ook over verschillende filesystems heen werken.

## 1 c) Shell:
Hoe kun je zien welke Shell je gebruikt? Hoe heet het startup script?

Met het commando echo schell 
<img width="968" height="103" alt="image" src="https://github.com/user-attachments/assets/5c053617-1cc7-472a-b09f-a129035e2662" />
naam startup script: ~/.bashrc
## 1 d) Piping:
Wat is het commando om alle processen met in de PID “100” te tonen?\
(gebruik hierbij o.a. `grep`)

<img width="955" height="557" alt="image" src="https://github.com/user-attachments/assets/4afaf9b8-39f9-45da-a3e3-33bd3fbf7fa1" />


## 1 e) Path:
Hoe kun je je PATH-variabele aanpassen zodat je niet steeds `./filenaam` hoeft te typen, maar simpelweg `filenaam` kunt gebruiken om een bestand in de huidige directory uit te voeren?\
Wat moet je toevoegen aan je shell startup script om deze wijziging permanent te maken?

export PATH=$PATH:.
deze regel moet toegevoegd worden aan het startup script: ~/.bashrc


## 1 f) Manual page:
Hoe kun je in de manual-pagina (met het commando `man`) zoeken naar een specifieke string?\
*Tip*: Standaard gebruikt `man`  de '*less*' pager.\
Wat is het commando om verder te zoeken naar de volgende overeenkomst?\
Hoe kun je een pagina omhoog of omlaag scrollen?

<img width="970" height="675" alt="image" src="https://github.com/user-attachments/assets/d2d0008a-5d09-4886-99eb-ddcb906b47bc" />
je kunt zoeken door /stringnaarkeuze
omhoog: k, b
omlaag: spatie, j


## 1 g) default directories:

Wat is het doel van de volgende directories? Geef een korte beschrijving van wat er typisch in deze directories wordt opgeslagen:

'/bin' – Basiscommando’s en uitvoerbare bestanden die door alle gebruikers nodig zijn (bv. ls, cp).
'/lib' – Belangrijke bibliotheken die nodig zijn voor de binaries in /bin en /sbin.
'/media' – Mount points voor verwisselbare media zoals USB-sticks, CD’s of externe schijven.
'/boot' – Bestanden die nodig zijn om het systeem op te starten, zoals de kernel en bootloader.
'/proc' – Virtueel bestandssysteem dat systeem- en procesinformatie bevat (runtime info van de kernel).
'/mnt' – Tijdelijke mount points die je zelf kunt gebruiken om filesystems te koppelen.
'/dev' – Apparaten en device-bestanden (bv. harde schijven, toetsenbord, terminals).
'/root' – Home directory van de root-gebruiker.
'/sbin' – Systeembinaries die meestal door de beheerder/root worden gebruikt (bv. fsck, ifconfig).
'/etc' – Configuratiebestanden van het systeem en geïnstalleerde programma’s.
'/usr' – Universele programma’s en bestanden voor gebruikers; tweede hiërarchie na /.
'/usr/share' – Systeemonafhankelijke data, zoals documentatie, iconen, en sjablonen.
'/home' – Home directories van normale gebruikers.
'/usr/bin' – Binaries voor normale gebruikers die niet in /bin staan.
'/usr/sbin' – Systeembinaries voor beheerders die niet in /sbin staan.
'/var' – Variabele bestanden zoals logs, caches, mail en tijdelijke data die verandert tijdens runtime.

## 1 h) default directories:

Waar vind je de volgende bestanden en wat is hun functie in het systeem?

1. `mount`, `ping`, `rm`, `mkfs`, `fdisk`, `rsyslogd`, `grub` en/of `lilo`
2. De `man`-pagina's (binaries en gecomprimeerde bestanden, zoals `*.gz`)
3. Configuratiebestanden voor netwerkinterfaces (interfaces) en hosts (hosts)

1.
mount /bin/mount of /usr/bin/mount - Mounten van filesystems
ping /bin/ping of /usr/bin/ping - Netwerkverbinding testen via ICMP
rm /bin/rm - Bestanden verwijderen
mkfs /sbin/mkfs - Filesystem aanmaken op een schijf/partitie
fdisk /sbin/fdisk - Partitioneren van harde schijven
rsyslogd /sbin/rsyslogd - Logserver voor systeem- en applicatielogs
grub /boot/grub of lilo /sbin/lilo - Bootloader voor het opstarten van Linux
man /usr/bin/man - Commando om man-pagina's te openen
man pages /usr/share/man/man[1-8]/ (bijv. ls.1.gz) - Documentatiebestanden van commando's en systeemfuncties
interfaces /etc/network/interfaces - Configuratie van netwerkinterfaces (IP-adressen, gateways)
hosts /etc/hosts - Lokaal hostnaam-resolutiebestand (koppelt hostnamen aan IP-adressen)

2.
man /usr/bin/man - Commando om man-pagina's te openen
man pages /usr/share/man/man[1-8]/ (bijv. ls.1.gz) - Documentatiebestanden van commando's en systeemfuncties

3.
interfaces /etc/network/interfaces - Configuratie van netwerkinterfaces (IP-adressen, gateways)
hosts /etc/hosts - Lokaal hostnaam-resolutiebestand (koppelt hostnamen aan IP-adressen)
   

# Opdracht 2 - Systeembeheer

## 2 a) Alias instellen voor home-directory
Welk commando kun je gebruiken om ervoor te zorgen dat wanneer je `home` in de console invoert, de huidige directory automatisch navigeert naar je home-directory? Leg uit hoe dit werkt.

<img width="1919" height="151" alt="image" src="https://github.com/user-attachments/assets/1d6f0b17-9690-4644-b098-d1c4fc5bbfb6" />


## 2 b) Overzicht van gemounte bestandssystemen
Welk commando geeft een overzicht van alle gemounte bestandssystemen en de beschikbare opslagruimte?

<img width="1906" height="347" alt="image" src="https://github.com/user-attachments/assets/2574b80b-e50a-49b8-8958-97a5abb52a0a" />


## 2 c) Het doel van `/proc`
Waarvoor worden de bestanden in de `/proc` directory gebruikt? Beschrijf hun algemene functie binnen het systeem.

dynamische virtuele bestanden die informatie over lopende sytemen en processen bevant
voorbeeld:
<img width="1919" height="292" alt="image" src="https://github.com/user-attachments/assets/5408778c-4ec4-4245-ae35-3437d87d8615" />

## 2 d) Specifieke bestanden in `/proc`
In de directory `/proc` staan onder andere de volgende virtuele bestanden: `version`, `cpuinfo`, `meminfo`, en `ioports`. Welke informatie geven deze bestanden? Beschrijf kort de inhoud van elk bestand.

version: Informatie over de kernelversie, compiler die gebruikt is en builddatum van de kernel
cpuinfo: geeft details over cpu, zie screenshot 2c
meminfo: informatie over geheugengebruik
ioports: overzicht geheugen en I/O poorten (hardware mapping)
<img width="1899" height="121" alt="image" src="https://github.com/user-attachments/assets/69cc7383-3d6c-43dd-a47b-c6ce8f85dd30" />


## 2 e) Device files voor harde schijven
Wat zijn de namen van de device files waarmee de kernel de harde schijven kan benaderen? Geef een overzicht van de naamgevingsconventies voor verschillende typen opslagapparaten (IDE, SATA, SCSI, NVMe).
/dev/hda → eerste IDE-schijf
/dev/hdb → tweede IDE-schijf

/dev/sda → eerste SCSI/SATA/USB-schijf
/dev/sdb → tweede schijf

/dev/nvme0n1 → eerste NVMe-schijf
/dev/nvme1n1 → tweede NVMe-schijf


## 2 f) Systeemmeldingen bekijken
Met welk commando kun je de laatste belangrijke systeemmeldingen (logs) bekijken? Beschrijf hoe je dit gebruikt om snel toegang te krijgen tot recente meldingen.
<img width="1891" height="442" alt="image" src="https://github.com/user-attachments/assets/ff6d914f-42a6-40d3-afbe-21433536ac1d" />
tail voor alleen het weergeven van de laatste 10 meldingen

## 2 g) Processen overzicht
Met welk commando kun je een overzicht krijgen van alle lopende processen op het systeem? Leg uit hoe je hiermee processen kunt beheren of controleren.
<img width="1915" height="392" alt="image" src="https://github.com/user-attachments/assets/7b921541-1e30-46fd-a006-819aca1dabdf" />


## 2 h) Services starten en instellen bij opstarten
Hoe kun je een service starten op het systeem, en hoe stel je een service zo in dat deze automatisch start bij het opstarten van het systeem? Beschrijf de benodigde commando's en de instellingen die hiervoor nodig zijn.
sudo systemctl start <service> - starten
sudo systemctl enable <service> - starten bij opstarten

# Opdracht 3 - Performance Monitoring

## 3 a) Overzicht van processen in `top`
Het commando `top` geeft een overzicht van processen en hun resourcegebruik, waarbij standaard wordt gesorteerd op CPU-gebruik. Het sample-interval is standaard ingesteld op 5 seconden.
<img width="1919" height="216" alt="image" src="https://github.com/user-attachments/assets/bf24ad14-5f5c-4d55-baae-1b8a1ef6c9f1" />

Met welke toets kun je een "toggle" uitvoeren tussen een enkel overzicht en de "alternate display"? Dit toont een gesorteerd overzicht van de belangrijkste "consumers" van verschillende systeemresources.
de toets t lijkt te togglen, f ook, maar  lijkt me het juiste antwoord

## 3 b) Analyse met `vmstat`
Het `vmstat`-commando geeft informatie over processen, geheugen, paging, block I/O, traps, en CPU-activiteit. Voer het `vmstat`-commando uit en bekijk de kolommen onder het gedeelte "procs".

1. Wat betekenen de velden "r" en "b" onder het gedeelte "procs"?
r zijn processen die CPU willen gebruiken, b dormant processen wachtende op I/O
2. Hoeveel interrupts en context switches per seconde worden er ongeveer gemeten?
<img width="1226" height="155" alt="image" src="https://github.com/user-attachments/assets/a8eb8cf8-ab6b-4a29-bcd7-f4a40c5e6ccf" />
50 interrupts
0 context switches

## 3 c) Processor-informatie met `mpstat`
Run het commando `mpstat -A`.

Hoeveel processoren (CPU's) zijn er in je systeem?
<img width="1919" height="737" alt="image" src="https://github.com/user-attachments/assets/990b087e-5e2f-41f2-b78d-b7e6043ed248" />
Er lijkt een processor aanwezig: CPU 0

# Opdracht 4 - Users en permissies

## 4 a) Uitleg van `rwx` permissies voor directories
Leg uit wat de `rwx`-permissies betekenen wanneer ze worden toegepast op een directory. Beschrijf hoe deze rechten zich verhouden tot de toegangsmogelijkheden voor gebruikers.

r: dit zijn read rechten, een gebruiker kan een dir 'uitlezen' met bijv ls
w: dit zijn write rechten, een gebruiker kan bestanden verwijderen of aanpassen
x: dit zijn execut rechten, een gebruiker kan navigeren binnen dirs

## 4 b) Rechten instellen op `rwxrwxrwx`
Met welk commando kun je de rechten van een bestand instellen op `rwxrwxrwx`? Beschrijf de stappen en betekenis van de opdracht.
chmod 777 bestandsnaam
dit command zorgt ervoor dat user, group en others volledige permissies hebben op een file
4 read, 2 write, 1 execute
eerste positie voor de user, tweede voor de group, derde voor others

## 4 c) Groep van een gebruiker aanpassen
Hoe kun je de primaire groep van een gebruiker wijzigen? Geef een voorbeeld van het commando en leg de syntaxis kort uit.
sudo usermod -g (primaire groep) developers (group) jan (user) - primaire groep wijzigen
sudo usermod -aG groep1,groep2 gebruikersnaam - aan groep toeveogen

## 4 d) Gebruikers met eigen SSH-sleutels aanmaken
Creëer drie gebruikers die elk met hun eigen SSH-sleutel kunnen inloggen. Beschrijf de stappen om de gebruikers aan te maken en de SSH-sleutels in te stellen.
<img width="1919" height="94" alt="image" src="https://github.com/user-attachments/assets/95db94c4-959b-4d04-af17-46c8b68c143f" />

<img width="1910" height="732" alt="image" src="https://github.com/user-attachments/assets/2bcaa466-81d3-4e0f-b6b9-c4ae8b2b2e03" />
<img width="1105" height="639" alt="image" src="https://github.com/user-attachments/assets/71641357-11bf-4342-b2de-739c9d0b4300" />
sleutelpaar voor gebruiker bennie is ook aangemaakt, beloofd

## 4 e) Gebruiker toevoegen aan de `sudoers`-groep
Maak één van de eerder aangemaakte gebruikers lid van de `sudoers`-groep, zodat deze gebruiker beheerrechten krijgt. Geef het benodigde commando en leg uit hoe je kunt verifiëren dat de gebruiker lid is van `sudoers`.
<img width="1901" height="122" alt="image" src="https://github.com/user-attachments/assets/74c3df67-866c-4a3c-b58f-687e533c6e94" />


## 4 f) Gedeelde directory en groep aanmaken
1. Maak in de home-directory van alle drie de gebruikers een directory met de naam `shared_dir`.
2. Creëer een groep genaamd `shared_usr` en maak de drie gebruikers lid van deze groep.
3. Geef de groep lees- en schrijfrechten op de `shared_dir` in elke home-directory.
4. Controleer of de gebruikers elkaar toegang kunnen geven tot hun `shared_dir`-directory.

<img width="1918" height="421" alt="image" src="https://github.com/user-attachments/assets/2a69c565-7c0c-45bb-8bdb-c205dbe12adb" />
<img width="1905" height="97" alt="image" src="https://github.com/user-attachments/assets/aed9de0a-2bdc-43b3-8330-0c89b03844bc" />
ik snap vraag 4 niet helemaal, de eigenaar van de shared_dir binnen de home dirs zijn zoals op de screenshot te zien de gebruikers zelf. verder heeft de groep shared_usr rwx rechten op de shared_dir. dus de gebruikers kunnen elkaar toegang geven tot hun shared_dir, maar deze hebben ze ook al via de group shared_usr. de rechten op de home dir zijn alleen nog niet goed ingesteld, waardoor je niet bij de shared_dir van een andere user kan komen; zie screenshot hieronder
<img width="1883" height="102" alt="image" src="https://github.com/user-attachments/assets/675e260c-3cf7-4f2b-8458-c4ba9f6f4511" />



# Opdracht 5 - Installeren van applicaties

## 5 a) Extracten van `.tgz` en `.tar.gz` bestanden
Veel Linux-software wordt geleverd in een zogenaamde “tarball” met extensies zoals `.tgz` of `.tar.gz`. Welke commando's gebruik je om zo'n bestand uit te pakken? Geef een voorbeeld met uitleg.
<img width="1871" height="547" alt="image" src="https://github.com/user-attachments/assets/d5b32295-f13e-4138-be5f-804f1f694bbb" />
<img width="1917" height="122" alt="image" src="https://github.com/user-attachments/assets/a63e49d3-dfcf-4902-bc4a-58ae9f39bf6a" />
xzf: decrompiren, uitpakken en filename

## 5 b) Overzicht van geïnstalleerde pakketten met `dpkg`
Met welk `dpkg`-commando kun je een lijst van alle geïnstalleerde pakketten opvragen? Beschrijf wat de output bevat en waarvoor dit handig is.
<img width="1904" height="672" alt="image" src="https://github.com/user-attachments/assets/aa273abd-7d9d-4f1c-87cf-41af93c35cce" />
hiermee kun je kijken welke pakketten zijn geinstalleerd . je ziet een beschrijving voor welke architectuur het pakket is, welke versie en een korte beschrijving van het pakket. dit is handig omdat je hiermee kunt contrelen welke software al geinstalleerd en klaar voor gerbuik is en of de geinstalleerde versie compatibel is met je systeem

## 5 c) Bestanden in een pakket opvragen met `dpkg`
Met welk `dpkg`-commando kun je achterhalen welke bestanden er bij het pakket `apache2` horen? Geef een voorbeeld en beschrijf kort hoe de output te interpreteren is.
dpkg -L apache2
<img width="1827" height="260" alt="image" src="https://github.com/user-attachments/assets/22ffa8c7-e8e2-4bd7-930c-6fceca28e84a" />
het toont alle filepaths die horen bij de package, in dit geval apache2

## 5 d) Locatie van `apache2` executable
Waar bevindt zich het uitvoerbare bestand (`executable`) voor `apache2`? Leg uit hoe je dit kunt achterhalen.
<img width="1908" height="58" alt="image" src="https://github.com/user-attachments/assets/cb7c8ebf-203c-4d79-92b0-9855efd42768" />
je kunt dit achterhalen met het command: which packagenaam 

## 5 e) Locatie van de `DocumentRoot` variabele
In welk configuratiebestand wordt de `DocumentRoot`-variabele voor `apache2` gedefinieerd? Beschrijf kort hoe je dit bestand kunt vinden en openen.
je kunt het vinden met dit commando:
<img width="1893" height="94" alt="image" src="https://github.com/user-attachments/assets/80cd57fd-e47b-4df0-8f9f-29665db32acb" />







