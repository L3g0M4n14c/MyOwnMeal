# ❓ FAQ - MyOwnMeal

Häufig gestellte Fragen und Antworten.

## Installation & Setup

### F: Ich bekomme Fehler beim `flutter pub get`
**A:** Das liegt meistens an alten Paketen:
```bash
flutter clean
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

### F: "Target of URI doesn't exist" Fehler
**A:** Code muss generiert werden:
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### F: App lädt nicht komplett
**A:** Versuche:
```bash
flutter clean
flutter run --verbose
```

### F: Hive Fehler beim Start
**A:** Hive Datenbank auf diesem Gerät zurücksetzen:
```dart
// In main.dart vor Hive.init()
await Hive.deleteBoxFromDisk('recipes');
await Hive.deleteBoxFromDisk('preferences');
// Dann neu starten
```

---

## Verwendung der App

### F: Wie füge ich Rezepte hinzu?
**A:** Zwei Optionen:
1. **Von URL:** "Rezept hinzufügen" → "Von URL" → Gib URL ein
2. **Manuell:** "Rezept hinzufügen" → "Manuell" → Typ Name ein

### F: Welche Websites funktionieren?
**A:** Websites mit:
- ✅ JSON-LD strukturierte Daten (best support)
- ✅ Schema.org Recipe Format
- ✅ Chefkoch, EatSmarter, Allrecipes, etc.

Die App versucht auch HTML-Fallback für andere Seiten.

### F: Kann ich Rezepte bearbeiten?
**A:** Noch nicht im MVP. Geplant für v2:
- [ ] Rezepte bearbeiten
- [ ] Foto hochladen
- [ ] Ratings & Kommentare

### F: Wie ändere ich meine Vorlieben?
**A:** 
1. Klick ⚙️ oben rechts auf Home
2. Wähle Diäten (vegan, vegetarisch, etc.)
3. Stelle Anzahl Gerichte und Kochzeit ein
4. Speichern

Das ändert Ihre **Standard-Einstellungen** für alle zukünftigen Wochenpläne.

### F: Was sind "Einstellungen für diese Woche"?
**A:** Optionale Überrides für die aktuelle Woche nur:
- Ändert nicht Ihre Standard-Einstellungen
- Wirkt sich nur auf den aktuellen Wochenplan aus
- Nächste Woche: Zurück zu Standards

---

## Wochenplan & Einkaufsliste

### F: Warum nur 3 Rezepte pro Woche?
**A:** Das ist der Standard:
- Optimal zum Kochen
- Passt zu 120 Min Kochzeit
- Sie können aber 1-7 Rezepte konfigurieren

### F: Wie funktioniert der "koordinierte Kochplan"?
**A:** Die App:
1. Nimmt Ihre 3 Rezepte
2. Liest Kochschritte und Zeiten
3. Optimiert paralleles Kochen
4. Zeigt Zeitplan (z.B. "Alle kochen parallel 45 Min statt 120 Min")

**Beispiel:**
```
Rezept A: 45 Min
Rezept B: 35 Min  
Rezept C: 40 Min
─────────────────
Parallel: ~45 Min (optimal!)
```

### F: Können Rezepte sich wiederholen?
**A:** Momentan ja, aber Sie können deaktivieren:
- Einstellungen → "Allow Repeat Recipes" deaktivieren
- Geplant für v2: Bessere Diversität

### F: Wie ist die Einkaufsliste organisiert?
**A:** 
- Nach Kategorie (Gemüse, Getreide, Protein, etc.)
- Mit Mengen (aggregiert von allen Rezepten)
- Mit Check-off System zum Abhaken

### F: Kann ich Items manuell zur Einkaufsliste hinzufügen?
**A:** Noch nicht. Geplant für v2:
- [ ] Items hinzufügen
- [ ] Items editieren
- [ ] Kategorien anpassen

---

## Technische Fragen

### F: Wo werden meine Daten gespeichert?
**A:** Lokal auf Ihrem Gerät in Hive:
- **iOS:** Documents Folder
- **Android:** App-spezifisches Verzeichnis
- **Keine Cloud-Speicherung** (MVP)

### F: Sind meine Daten sicher?
**A:** 
- ✅ Lokal (nicht im Internet)
- ✅ App-privat (nur diese App kann zugreifen)
- ⚠️ Kein Backup (wenn App gelöscht, Daten weg)
- 🔄 Cloud-Backup in v2 geplant

### F: Kann ich meine Daten exportieren?
**A:** Noch nicht. Geplant für v2:
- [ ] JSON Export
- [ ] CSV für Excel
- [ ] Cloud Backup

### F: Funktioniert die App offline?
**A:** Teilweise:
- ✅ Rezepte anzeigen (lokal gespeichert)
- ✅ Wochenpläne erstellen
- ✅ Einkaufslisten verwenden
- ❌ Neue Rezepte von URLs scrapen (braucht Internet)

### F: Welche Android/iOS Versionen?
**A:** 
- **Android:** 5.0+ (API Level 21+)
- **iOS:** 11.0+

### F: Funktioniert auf Web/Desktop?
**A:** 
- **Web:** Noch nicht konfiguriert (später möglich)
- **Desktop (Windows/Mac/Linux):** Noch nicht konfiguriert

---

## Provider & State Management

### F: Wie funktioniert die Provider Integration?
**A:** 
- App nutzt Provider für State Management
- Screens beobachten Provider mit `Consumer`
- Wenn State sich ändert → UI re-rendert

Beispiel:
```dart
Consumer<RecipeProvider>(
  builder: (context, provider, _) {
    return Text(provider.recipes.length);
  }
)
```

### F: Warum 3 verschiedene Provider?
**A:** Separation of Concerns:
- `RecipeProvider` - Rezept-CRUD
- `PreferencesProvider` - Benutzer-Settings
- `MealPlanProvider` - Wochenplan & Koordination

Besser als alles in einem Riesenprovider.

### F: Kann ich Daten zwischen Screens teilen?
**A:** Ja, durch Provider:
```dart
// Auf Screen A
context.read<RecipeProvider>().addRecipe(recipe);

// Auf Screen B
Consumer<RecipeProvider>(
  builder: (context, provider, _) {
    // Sieht neues Rezept sofort!
    return Text(provider.recipes.length.toString());
  }
)
```

---

## LLM Integration

### F: Warum ist LLMService ein Mock?
**A:** 
- MVP fokussiert auf Features, nicht AI
- LLMService ist vorbereitet für echte APIs
- Later: OpenAI, Google Gemini, Claude

### F: Wie integriere ich OpenAI?
**A:** Siehe `DEVELOPMENT.md` und `ARCHITECTURE.md`:
1. OpenAI API Key beschaffen
2. `llm_service.dart` updaten
3. Implement actual API calls
4. Test

### F: Ist der Mock gut genug?
**A:** Für MVP ja:
- Sortiert Rezepte nach Kochzeit
- Erstellt Zeitplan
- Zeigt Tipps
- Perfekt für Prototyping

---

## Performance & Fehler

### F: App lädt langsam
**A:** Das können Sie versuchen:
- App neustarten
- Weniger Rezepte adden (Performance teste)
- Älteren Android/iOS? → App kann langsamer sein

### F: Rezept-Scraping funktioniert nicht
**A:** 
- Website hat vielleicht kein JSON-LD
- HTML-Fallback kann nicht parsen
- Versuche andere Website
- Oder nutze Manuell-Modus

### F: Crash beim "Wochenplan erstellen"
**A:** 
- Keine Rezepte vorhanden? Füge zuerst Rezepte hinzu!
- Bug? Report via GitHub Issue
- Versuche `flutter clean` + Neustart

---

## Feature-Wünsche & Roadmap

### F: Wann kommt X Feature?
**A:** Siehe Roadmap:
- **v1 (MVP):** ✅ Fertig
  - Rezept-Management
  - Wochenplan
  - Einkaufsliste
- **v2 (Q1 2026):** Geplant
  - Cloud Sync
  - LLM Integration
  - Multi-Device
- **v3+:** Ideeen
  - Social Sharing
  - Allergie-Management
  - Meal Prep Videos

### F: Kann ich ein Feature vorschlagen?
**A:** Ja! 
1. GitHub Issues öffnen
2. Feature beschreiben
3. Oder: Selbst implementieren & PR

### F: Kann ich den Code anpassen?
**A:** Ja!
1. Fork repo
2. Ändere Code
3. PR einreichen
4. Code Review
5. Merge! 🎉

---

## Bekannte Bugs & Workarounds

### Bug: Rezept-Detail zeigt nicht alle Schritte
**Workaround:** App neustarten oder Screen wechseln

### Bug: Hive wirft Fehler bei großen Listen
**Workaround:** Begrenzen Sie Rezepte auf <1000

### Bug: Scraping manchmal timeout
**Workaround:** Netzwerkverbindung prüfen

---

## Wenn nichts mehr hilft

### Schritt 1: App Reset
```bash
# Alle Daten löschen
flutter clean
rm -rf ios/Pods
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
flutter run
```

### Schritt 2: Issue auf GitHub
- Beschreibe das Problem
- Gib iOS/Android Version
- Gib Flutter Version: `flutter --version`

### Schritt 3: Kontakt
- Email: [Your Email]
- GitHub Issues: [Link]

---

## Häufig übersehen

### "Ich finde den Settings Button nicht"
**Antwort:** ⚙️ Icon oben rechts auf Home Screen

### "Rezepte werden nicht gespeichert"
**Antwort:** 
- ✅ Gespeichert in Hive (lokal)
- Nicht synchronisiert zwischen Geräten (noch nicht)

### "Warum funktionieren manche URLs nicht?"
**Antwort:** 
- Nicht alle Websites haben JSON-LD
- HTML-Parser unterstützt nicht alle Formate
- Versuche andere Website oder Manuell-Modus

---

## Community

### Wo kann ich Hilfe bekommen?
- 📖 Lies die README & Docs
- 🐛 GitHub Issues
- 💬 Kontakt via Email

### Kann ich mithelfen?
- Ja! Fork → Code → PR
- Siehe DEVELOPMENT.md

### Wo teile ich Feedback?
- GitHub Issues
- Email
- Feature Requests willkommen!

---

**Version:** 1.0 MVP
**Letzte Aktualisierung:** November 2025

**Viel Erfolg mit MyOwnMeal! 🍽️**

*Hast du eine Frage, die hier nicht beantwortet wird? Öffne einen GitHub Issue!*
