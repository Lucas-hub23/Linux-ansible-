#!/bin/bash
# 1. Controleer of er precies twee parameters zijn meegegeven
if [ "$#" -ne 2 ]; then
    echo "Fout: Onjuist aantal parameters."
    echo "Gebruik: $0 <bronmap> <modus>"
    exit 1
fi

BRONMAP=$1
MODUS=$2

# 2. Controleer of de bronmap bestaat
if [ ! -d "$BRONMAP" ]; then
    echo "Fout: Map '$BRONMAP' bestaat niet."
    exit 1
fi

# 3. Controleer of de modus correct is (maand of week)
if [[ "$MODUS" != "maand" && "$MODUS" != "week" ]]; then
    echo "Fout: Tweede parameter moet 'maand' of 'week' zijn."
    exit 1
fi

echo "Start met organiseren van foto's in: $BRONMAP op basis van $MODUS..."

# Loop door alle bestanden in de bronmap
shopt -s nullglob
for bestand in "$BRONMAP"/*.{jpg,jpeg,png,gif,JPG,JPEG,PNG,GIF}; do
    # Controleer of het een echt bestand is
    [ -e "$bestand" ] || continue
    
    # Haal de datum van de laatste wijziging op
    if [[ "$MODUS" == "maand" ]]; then
        # Formaat: YYYY-MM
        SUBMAP=$(date -r "$bestand" +"%Y-%m")
    else
        # Formaat: week-WW
        SUBMAP="week-$(date -r "$bestand" +"%V")"
    fi
    
    DOELMAP="$BRONMAP/$SUBMAP"
    
    # Maak de doelmap aan als deze nog niet bestaat
    mkdir -p "$DOELMAP"
    
    BESTANDSNAAM=$(basename "$bestand")
    DOEL_LOCATIE="$DOELMAP/$BESTANDSNAAM"
    
    # 4. Kopieer het bestand naar de nieuwe map
    if cp "$bestand" "$DOEL_LOCATIE"; then
        # 5. Hashcontrole (md5sum)
        HASH_BRON=$(md5sum "$bestand" | awk '{ print $1 }')
        HASH_DOEL=$(md5sum "$DOEL_LOCATIE" | awk '{ print $1 }')
        
        if [ "$HASH_BRON" = "$HASH_DOEL" ]; then
            # Hashes komen overeen: verwijder origineel
            rm "$bestand"
            echo "Succes: $BESTANDSNAAM verplaatst naar $SUBMAP"
        else
            # Hashes komen NIET overeen: verwijder de corrupte kopie
            rm "$DOEL_LOCATIE"
            echo "FOUT: Hash mismatch voor $BESTANDSNAAM. Origineel behouden."
        fi
    else
        echo "FOUT: Kon $BESTANDSNAAM niet kopiëren naar $DOELMAP."
    fi
done

echo "Klaar!"
