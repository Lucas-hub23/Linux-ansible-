# Linux - Practicum week 2

In dit practicum gaan we werken aan de basisvaardigheden voor het gebruik van Linux (Unix) en leren we enkele essentiële systeembeheertaken uitvoeren. De opdracht richt zich op het vertrouwd raken met de kernprincipes en het zelfstandig kunnen uitvoeren van beheeractiviteiten binnen een Linux-omgeving. Dit omvat onder andere het werken met de terminal, navigeren door het bestandssysteem, en het uitvoeren van basiscommando’s om informatie op te vragen en systemen te beheren.

De onderdelen van dit practicum omvatten:

1. Bash scripting: Hierbij leer je de basisvaardigheden van bash scripting om efficiënt taken te automatiseren binnen een Linux-omgeving. Dit omvat het schrijven van scripts voor bestandsbeheer, systeembeheer en het uitvoeren van herhalende taken met variabelen, loops en voorwaarden.

**Belangrijk**: Bij elk commando dat je uitvoert om een resultaat of antwoord te verkrijgen, is het verplicht om een screenshot te maken van je scherm als bewijs van voortgang. Deze afbeeldingen tonen aan dat de opdracht correct is uitgevoerd en helpen je ook om je resultaten bij te houden.

Verder is het essentieel om al je voortgang en resultaten vast te leggen in een private Git-repository(Bijvoorbeeld op GitHub). Hiermee leer je niet alleen werken met versiebeheer, maar zorg je er ook voor dat alle stappen van je werk overzichtelijk en reproduceerbaar zijn.

Bij voorkeur gebruik je MarkDown, zodat het document ook nog enigszins oogt. Via deze link vind je meer informatie over Markdown op github:
[Basic writing and formatting syntax - GitHub Docs](https://docs.github.com/en/github/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax)

Een manier om gemakkelijk met markdown en git te werken is door in Visual Studio Code(VS Code) een plug-in voor Markdown the instaleren, en vanuit VS Code commits te maken en deze te pushen naar je eigen private Git Repo.


## Inleveren
Zowel de tekstdocumenten als de geproduceerde scripts houden jullie bij op zowel jullie Git repo. De tekstdocumenten en Scripts leveren jullie ook in op de Elo omgeving.

# Opdracht: Automatisch Foto's Organiseren met een Linux Shell Script

## Probleemomschrijving
Stel dat je een smartphone hebt waarmee je dagelijks mooie foto’s maakt. Deze foto’s worden automatisch gedeeld en gesynchroniseerd met je laptop via een cloud-oplossing. Na een jaar merk je dat het organiseren van foto’s in verschillende mappen veel tijd kost, vooral omdat je de foto’s wilt kunnen terugvinden door ze in logische submappen te plaatsen.

Je besluit om een eenvoudig tooltje te maken in de vorm van een Linux shell script dat de foto’s automatisch in mappen organiseert. Het script helpt je om tijd te besparen door foto’s te verplaatsen naar mappen op basis van het moment waarop ze zijn gemaakt.

## Doelstelling
Maak een shell script dat foto’s automatisch organiseert door ze te verplaatsen naar submappen, gesorteerd op basis van de maand of week waarin ze zijn gemaakt. Dit script moet voldoen aan de volgende specificaties:

- Het script accepteert twee parameters:
  - **Eerste parameter**: De directory waarin de foto's staan.
  - **Tweede parameter**: Een aanduiding, “maand” of “week”.
  
  Afhankelijk van de tweede parameter organiseert het script de foto’s in mappen op basis van maand of week.

- Het script moet:
  - Foto’s verplaatsen naar een nieuw te maken map.
  - Bij de optie “week” de foto’s verplaatsen naar submappen met het corresponderende weeknummer.
  - De originele foto alleen verwijderen als de verplaatsing succesvol is.

## Functie-eisen

1. **Parameterbeheer**:
   - Het script moet controleren of beide parameters aanwezig zijn.
   - De eerste parameter geeft de bronmap van de foto’s aan.
   - De tweede parameter moet “maand” of “week” zijn. Het script moet controleren of dit correct is ingevoerd.

2. **Automatisch Organiseren**:
   - Als de tweede parameter “maand” is, moet het script foto’s verplaatsen naar submappen op basis van de maand waarin de foto is gemaakt.
   - Als de tweede parameter “week” is, moet het script foto’s verplaatsen naar submappen met het corresponderende weeknummer van het jaar.

3. **Hashcontrole en Verwijdering**:
   - Na het verplaatsen moet het script de hash (bijvoorbeeld met behulp van `md5sum`) van de originele foto en de kopie in de doellocatie controleren.
   - Alleen als de hashes overeenkomen (dus de verplaatsing is succesvol) wordt de originele foto verwijderd.

4. **Foutafhandeling**:
   - Het script moet meldingen geven voor ontbrekende parameters of foutieve invoer.
   - Bij een fout in het kopiëren mag de originele foto niet worden verwijderd en moet er een foutmelding worden weergegeven.

## Voorbeeldgebruik

Stel dat je een script hebt genaamd `foto_organiseer.sh`. Hieronder volgen enkele voorbeeldcommando’s:

```bash
# Verplaats foto’s naar maandelijkse mappen
./foto_organiseer.sh /pad/naar/fotos maand

# Verplaats foto’s naar wekelijkse mappen
./foto_organiseer.sh /pad/naar/fotos week
```

In dit voorbeeld:

- **Maand**: Foto’s worden verplaatst naar mappen zoals `/pad/naar/fotos/2024-01` voor januari 2024, `/pad/naar/fotos/2024-02` voor februari, etc.
- **Week**: Foto’s worden verplaatst naar mappen zoals `/pad/naar/fotos/week-01` voor de eerste week van het jaar, `/pad/naar/fotos/week-02` voor de tweede week, etc.

## Implementatie-instructies

1. **Parametercontrole**:
   - Controleer of er precies twee parameters zijn ingevoerd.
   - Controleer of de tweede parameter geldig is (“maand” of “week”).

<img width="506" height="63" alt="image" src="https://github.com/user-attachments/assets/5228e2b9-eac6-422f-8e00-4ed030c49a96" />
2. **Maak de Mappen aan en Verplaats Foto's**:
   - Gebruik bestandsinformatie (zoals wijzigingsdatum) om foto’s in de juiste map te plaatsen.
   - Voor “maand” maakt het script mappen aan op basis van jaar en maand.
   - Voor “week” maakt het script mappen aan op basis van het weeknummer van het jaar.
Zie voorbeeld hieronder. 

3. **Hashverificatie voor Verwijdering**:
   - Na het kopiëren van een foto, vergelijk je de hash (met `md5sum`) van de bron en de doelkopie.
   - Verwijder de originele foto alleen als de hashwaarden overeenkomen, zodat je zeker weet dat de kopie identiek is.

<img width="576" height="192" alt="image" src="https://github.com/user-attachments/assets/7ad0367e-4c54-4720-b8b6-094da6c586a2" />

4. **Logging en Foutmeldingen**:
   - Voeg meldingen toe zodat de gebruiker kan zien wat het script doet.
   - Geef foutmeldingen als er iets misgaat, bijvoorbeeld als een bestand niet succesvol kan worden gekopieerd.
  
Door het script heen maakt het script gebruik van echo/meldingen om aan te geven wat er mis gaat.

#Disclaimer: AI is gebruikt bij het schrijven/begrijpen van het script. Het scipt wordt in volledigheid begrepen door ons studenten en AI is alleen gebruikt als ondersteuning. 

<img width="648" height="202" alt="image" src="https://github.com/user-attachments/assets/6edacb42-6987-43d7-aa90-78dd714e0347" />

<img width="843" height="192" alt="image" src="https://github.com/user-attachments/assets/ddf3e6c8-e20c-41cd-90f3-bb9cc958e170" />

<img width="474" height="74" alt="image" src="https://github.com/user-attachments/assets/9aee346c-2e15-47ee-9b2d-fe6f1ee990d7" />

<img width="518" height="79" alt="image" src="https://github.com/user-attachments/assets/c306aa58-e8c9-429b-bd14-b62d5a56efb6" />

<img width="492" height="54" alt="image" src="https://github.com/user-attachments/assets/4950b53d-2211-4958-a846-aa318698ffda" />

<img width="561" height="59" alt="image" src="https://github.com/user-attachments/assets/5fff24e1-7c0d-4ddf-a4dd-48a391f9b476" />




