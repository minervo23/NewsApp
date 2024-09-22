# NewsApp 

NewsApp ist eine SwiftUI-basierte Nachrichtenanwendung, die die NewsAPI verwendet, um aktuelle Nachrichten und Artikel anzuzeigen. Benutzer können Artikel nach Kategorien durchsuchen, nach spezifischen Themen suchen und Artikel zu ihren Lesezeichen hinzufügen.

## Features 
• Anzeige von Nachrichtenartikeln aus verschiedenen Kategorien <br />
• Suchfunktion für spezifische Nachrichten <br />
• Lesezeichenfunktion für das Speichern von Artikeln <br />
• Offline-Zugriff auf gespeicherte Artikel <br />
• Anzeige und Verwaltung des Suchverlaufs <br />
• Verwendung von SwiftUI für die Benutzeroberfläche und asynchrone Datenverarbeitung <br />

## Installation 
1. NewsAPI-Konto erstellen: <br />
  • Registiere dich auf newsapi.org, um einen API-Schlüssel zu erhalten.<br />
2. API-Schlüssel einfügen
   • Ersetze in der Datei `NewsAPI.swift` den Platzhalter "apikey" durch deinen persöhnlichen API-Schlüssel. <br />
3. projekt ausführen:
   • Öffne das Projekt in Xcode. <br />
   • Stelle sicher, dass dein Zielgerät oder Simulator ausgewählt ist.
   • Drücke `Cmd + R`, um das Projekt auszuführen.

## Verwendete Technologien 
• **SwiftUI**: Für die Erstellung der Benutzeroberfläche. <br />
• **NewsAPI**: Für den Abruf von Nachrichten<br />
• **PropertyListEncoder/Decoder**: Zum Speichern von Lesezeichen ud Suchverläufen in der App. <br />
• **MainActor**: Zur Steuerung von UI-Aktualisierungen auf dem Haupt-Thread <br />
• **Async/Await**: Für die asynchrone Datenverarbeitung in Swift <br />

## Projektstruktur

## Wichtige Dateien: 
• **NewsAPI.swift**: Diese Datei enthält die API-Logik, um Nachrichtenartikel von der NewsAPI abzurufen.<br />
• **ArticleNewsViewModel.swift**: ViewModel, das die Artikeldaten von der API lädt und den UI-Status verwaltet.<br />
• **ArticleSearchViewModel.swift**: ViewModel für die Suchfunktion, um Artikel basierend auf Benutzereingaben zu suchen und den Suchverlauf zu verwalten.<br />
• **ArticleBookmarkViewModel.swift**: Verwalten der Lesezeichenfunktion für gespeicherte Artikel.<br />
• **PlistDataStore.swift**: Eine generische Klasse zum Speichern und Laden von Daten in einer Property List-Datei (Plist).<br />

## Views 
• **NewsTabView.swift**: Hauptansicht der App, in der Nachrichtenkategorien ausgewählt und Artikel angezeigt werden.<br />
• **ArticleListView.swift**: Eine Liste, die die geladenen Nachrichtenartikel anzeigt.<br />
• **ArticleRowView.swift**: Die Darstellung einer einzelnen Nachrichtenartikel-Zeile mit Lesezeichen- und Teilen-Buttons.<br />
• **SearchTabView.swift**: Ermöglicht das Suchen von Artikeln mit einer interaktiven Suchleiste.<br />
• **BookmarkTabView.swift**: Zeigt eine Liste der vom Benutzer gespeicherten Artikel an.<br />
• **EmptyPlaceholderView.swift**: Einfache View, die angezeigt wird, wenn keine Inhalte (z.B. Artikel) verfügbar sind.<br />
• **RetryView.swift**: Zeigt eine Schaltfläche an, um bei Fehlern das Laden von Artikeln erneut zu versuchen.<br />
• **SafariView.swift**: Ermöglicht das Anzeigen eines Artikels in einem Safari-View.<br />
• **SearchHistoryListView.swift**: Zeigt den Suchverlauf der Benutzer an, der gelöscht oder erneut verwendet werden kann.<br />

## API-Verwendung 
Die App verwendet die NewsAPI, um Nachrichtenartikel basierend auf Kategorien oder Suchanfragen zu laden.<br />

**Kategorieabruf**: 
```
func fetch(from category: Category) async throws -> [Article]
```

**Suchanfragen**: 
```
func search(for query: String) async throws -> [Article]
```

**Fehlerbehandlung**: 
Alle API-Anfragen verwenden do-catch, um Fehler abzufangen und in der UI entsprechend anzuzeigen.

## Lesezeichen und Suchverlauf
Gespeicherte Artikel und Suchverläufe werden lokal im Dateisystem der App als Plist-Dateien gespeichert. Sie werden bei App-Starts automatisch geladen, sodass Nutzer auch offline auf ihre gespeicherten Daten zugreifen können.

**Lesezeichenfunktion**
• Artikel können durch Tippen auf das Lesezeichen-Symbol in der Artikelzeile gespeichert oder entfernt werden.<br />
• Gespeicherte Artikel werden in der BookmarkTabView angezeigt.<br />

**Suchverlauf**
• Der Suchverlauf wird in der SearchTabView verwaltet und kann bei Bedarf durch den Benutzer gelöscht werden.<br />
• Vorherige Suchanfragen werden als Vorschläge angezeigt, wenn ein Benutzer eine neue Suche beginnt<br />

**Weitere Anpassungen**
Du kannst die App weiter anpassen, indem du:

Weitere Kategorien hinzufügst, indem du die Category-Enumeration erweiterst.<br />
• Die Darstellung der Artikel in ArticleRowView.swift anpasst.<br />
• Lokalisierung hinzufügst, um die App in mehreren Sprachen anzubieten.<br />
• UI-Komponenten weiter modifizierst, wie zum Beispiel EmptyPlaceholderView oder RetryView.<br />



![simulator_screenshot_D433B9A8-6727-4465-9A08-391ED9193710](https://github.com/user-attachments/assets/505e3b04-2877-41e4-b47e-6b8ae0a3c8de)


![simulator_screenshot_6356B32C-58E8-4B5A-8BBA-AECA9B897B29](https://github.com/user-attachments/assets/b71142ae-3531-4911-b1d9-c949ba4d4931)


![simulator_screenshot_D1E78146-58C0-42F6-ABA0-5703CE169214](https://github.com/user-attachments/assets/3850ecaa-6410-49cc-a7a4-361efae683fa)






