# Jestem OK – prototyp designu

**Prototyp wizualny (makieta) do pokazu.** To nie jest działająca aplikacja ani gotowy produkt – plik służy wyłącznie do zaprezentowania wyglądu i przepływu ekranów aplikacji mobilnej „Jestem OK”.

> Aplikacja nie wysyła powiadomień, nie komunikuje się z żadnym serwerem i nie wzywa pomocy. Wszystkie dane zostają lokalnie w przeglądarce.

## Cel prototypu

Pokazanie koncepcji prostej aplikacji do codziennego potwierdzania samopoczucia: jeden duży przycisk „Jestem OK” oraz szybki dostęp do zaufanych bliskich. Prototyp ma pomóc ocenić układ, czytelność, kolorystykę i sposób nawigacji, zanim powstanie właściwa aplikacja. Główną grupą docelową są **seniorzy**, dlatego design jest podporządkowany prostocie i czytelności.

## Prezentowane ekrany

| Ekran | Co pokazuje |
|---|---|
| **Dzisiaj** | Powitanie z datą, kartę „Jak się dziś czujesz?” z przyciskiem *Jestem OK* oraz skrót *Skontaktuj się z bliskim*. |
| **Potwierdzenie** | Podziękowanie, informację o zapisanym potwierdzeniu (data, godzina) i powrót do ekranu głównego. |
| **Bliscy** | Listę zaufanych kontaktów z przyciskiem *Zadzwoń* oraz opcję *Dodaj bliską osobę*. |

Prototyp ma formę **zwykłej aplikacji webowej z jednym ekranem naraz**: na telefonie zajmuje cały ekran, a na komputerze jest wyśrodkowaną kolumną o szerokości do 520 px. Każdy widok ma własny adres (`#/dzisiaj`, `#/potwierdzenie`, `#/bliscy`), więc działa przycisk „wstecz” w przeglądarce, a stronę można odświeżyć lub dodać do zakładek.

## Co jest klikalne

Prototyp ma proste interakcje, żeby pokaz był bardziej przekonujący:

- przycisk *Jestem OK* przenosi na ekran potwierdzenia i zapisuje godzinę,
- dolna nawigacja (*Dzisiaj* / *Bliscy*) przełącza widoki,
- *Dodaj bliską osobę* otwiera przykładowy formularz,
- przyciski *Zadzwoń* używają linków `tel:` (na telefonie otwierają aplikację połączeń),
- logo „JESTEM OK” w nagłówku zawsze wraca do ekranu głównego.

Dane przykładowe (imię użytkownika, kontakty Anna i Piotr) są wpisane na stałe i można je zmienić w kodzie.

---

## Czytelność i prostota dla seniorów

Poniżej zebrane są decyzje projektowe, które zostały faktycznie zastosowane w kodzie.

### Hierarchia i prostota

- **Jedna główna akcja na ekranie.** Na ekranie *Dzisiaj* dominuje przycisk *Jestem OK* – największy element, wypełniony kolorem. Akcja dodatkowa (*Skontaktuj się z bliskim*) ma styl konturowy, więc jest widoczna, ale nie konkuruje z główną.
- **Tylko dwie zakładki.** Nawigacja ogranicza się do *Dzisiaj* i *Bliscy*. Nie ma ukrytych menu, gestów ani rozwijanych list.
- **Krótkie, proste komunikaty** po polsku, w pierwszej osobie lub do użytkownika po imieniu („Dzień dobry, Mario”, „Dziękujemy, Mario!”). Bez żargonu technicznego.
- **Przyciski nazywają akcję wprost**: „Zadzwoń: Anna”, „Wróć do ekranu głównego”, „Dodaj bliską osobę”. Ta sama akcja ma wszędzie tę samą nazwę.
- **Wyraźne potwierdzenie działania.** Po naciśnięciu *Jestem OK* użytkownik widzi osobny ekran z ikoną, podziękowaniem oraz dokładną datą i godziną zapisu – nie ma wątpliwości, czy się udało.
- **Brak presji.** Status „Dziś jeszcze nie potwierdzono” jest podany neutralnym szarym kolorem, bez czerwieni, wykrzykników i alarmującego tonu.
- **Brak elementów znikających samoczynnie** (toastów, liczników czasu) – użytkownik sam decyduje, kiedy przejść dalej.

### Rozmiary i odstępy

| Element | Rozmiar w prototypie |
|---|---|
| Przycisk *Jestem OK* | wysokość 104 px, tekst 29 px, ikona 58 px |
| Przyciski dodatkowe (konturowe) | wysokość 62–64 px, tekst 19 px |
| Przycisk *Wróć do ekranu głównego* | wysokość 72 px, tekst 21 px |
| Zakładki nawigacji | wysokość 68 px, tekst 18 px |
| Nagłówki ekranów | 34 px (na ekranie potwierdzenia 38 px) |
| Tekst pomocniczy | 17–21 px |
| Imię kontaktu / numer telefonu | 26 px / 23 px |
| Pola formularza | wysokość 56 px, tekst 19 px |

- Wszystkie elementy dotykowe mają wysokość co najmniej 56 px, czyli wyraźnie więcej niż typowe minimum 44–48 px. Ułatwia to trafianie palcem.
- Duże marginesy (24 px po bokach, ok. 30 px między sekcjami) i zaokrąglone, rozdzielone karty porządkują ekran.
- Jedna kolumna, układ od góry do dołu – bez elementów obok siebie na ekranie telefonu.

### Kolory i kontrast

- Paleta jest spokojna i ciepła: jasne tło `#f7f6f2`, biała karta, zieleń `#256a47` jako kolor akcji i marki, jasna mięta `#e3eee6` na tła ikon i aktywnej zakładki, ciemny tekst `#26302b`.
- Zieleń kojarzy się z „w porządku” i bezpieczeństwem. Biały tekst na zielonym przycisku oraz zielony tekst na białym tle mają kontrast ok. 6,5:1, czyli powyżej progu 4,5:1 (WCAG AA).
- Informacja nigdy nie jest przekazywana samym kolorem – zawsze towarzyszy jej tekst lub ikona z podpisem.

### Ikony i czcionka

- Ikony są zawsze **z podpisem tekstowym** (zakładki, przyciski). Ikona nie występuje samodzielnie jako jedyny nośnik znaczenia.
- Czcionka **Inter** – bezszeryfowa, o dużej wysokości x i wyraźnych kształtach liter. Ważne akcje są pogrubione (600–700), reszta tekstu ma zwykłą grubość.
- Tekst w jednym stylu i w jednym języku, bez wersalików i ozdobnych krojów (jedynie logo „JESTEM OK” jest pisane wersalikami).

### Dostępność techniczna

- `lang="pl"` w dokumencie oraz poprawne daty i godziny w formacie polskim (`pl-PL`).
- Widoczny obrys fokusu (3 px) przy obsłudze klawiaturą. Po zmianie ekranu fokus trafia na jego nagłówek, a okno formularza to natywny `<dialog>` (blokuje fokus wewnątrz okna, zamyka się klawiszem Esc).
- Nawigacja to zwykłe linki, więc działa przycisk „wstecz” i klawiatura. Status potwierdzenia ma `role="status"`.
- `aria-current` na aktywnej zakładce, ikony ozdobne oznaczone jako `aria-hidden`.
- Ustawienia widoku nie blokują powiększania strony.
- Szanowane ustawienie systemowe `prefers-reduced-motion` (animacje są wyłączane); same animacje są krótkie (ok. 0,2 s).
- Dane wpisywane przez użytkownika są escapowane przed wyświetleniem.

### Do poprawy w wersji docelowej

- Szary tekst pomocniczy (`#6f766f` na jasnym tle) ma kontrast ok. 4,3:1 – nieco poniżej progu AA, warto go przyciemnić.
- Rozmiary czcionek są podane w pikselach, więc nie skalują się z systemowym ustawieniem wielkości tekstu. W produkcie warto użyć jednostek względnych (`rem`).
- Brak testów z prawdziwymi użytkownikami-seniorami oraz z czytnikami ekranu.

---

## Opis kodu designu

Całość znajduje się w jednym pliku `index.html` i składa się z trzech części.

### 1. Style (CSS)

- **Tokeny w `:root`** – kolory zdefiniowane jako zmienne CSS: `--bg`, `--green`, `--green-press`, `--mint`, `--ink`, `--muted`, `--line`, `--card`. Zmiana motywu wymaga edycji tylko tych kilku linii.
- **Komponenty:**
  - `.card` – biała karta z obrysem i dużym zaokrągleniem (24 px),
  - `.btn-ok` – duży przycisk główny,
  - `.btn-solid` – wypełniony przycisk standardowy,
  - `.btn-line` – przycisk konturowy (akcje dodatkowe i *Zadzwoń*),
  - `.tab` – zakładka dolnej nawigacji, stan aktywny `.active`,
  - `.avatar` – okrągły awatar z inicjałami,
  - `.sheet-dialog` i `.sheet` – okno dodawania kontaktu (natywny `<dialog>`) wysuwane od dołu.
- **Układ aplikacji** (`.app`) – jedna kolumna o szerokości do 520 px, wyśrodkowana na komputerze i na całą szerokość na telefonie. Składa się z nagłówka z logo, treści ekranu i dolnej nawigacji przyklejonej do dołu (`position: sticky`). Uwzględnia wcięcia ekranu telefonów (`env(safe-area-inset-*)`).
- **Animacje** – delikatne wejście widoku, wysunięcie okna i reakcja przycisków na kliknięcie; wyłączane przy `prefers-reduced-motion`.

### 2. Ikony

Obiekt `I` zawiera funkcje zwracające wbudowane ikony SVG (serce, znacznik, dom, ludzie, telefon, plus). Ikony dziedziczą kolor tekstu (`currentColor`), więc zmieniają się razem z motywem.

### 3. Logika (JavaScript)

- **`state`** – stan aplikacji: lista kontaktów i czas potwierdzenia. Zapisywany w `localStorage` pod kluczem `jestem-ok-v1`; funkcja `confirmedAt()` uznaje potwierdzenie tylko w dniu, w którym zostało zapisane.
- **`views`** – funkcje `today()`, `done()` i `contacts()` zwracające HTML poszczególnych ekranów.
- **Routing (`ROUTES`, `route()`)** – prosty router oparty na `location.hash` (`#/dzisiaj`, `#/potwierdzenie`, `#/bliscy`). Po zmianie adresu renderuje odpowiedni widok, ustawia aktywną zakładkę, tytuł karty i fokus. Wejście na `#/potwierdzenie` bez dzisiejszego potwierdzenia przekierowuje na ekran główny.
- **Akcje** – jedno nasłuchiwanie kliknięć (delegacja zdarzeń przez atrybut `data-act`): `confirm` zapisuje potwierdzenie i przechodzi na ekran potwierdzenia, `add` otwiera okno dodawania kontaktu (`openAddDialog()`).
- **Odświeżanie** – po powrocie do karty przeglądarki (`visibilitychange`) widok jest odświeżany, więc następnego dnia status „Dziś potwierdzono” znika.
- **Funkcje pomocnicze** – `esc()` (zabezpieczenie wyświetlanego tekstu), `initialsOf()` (inicjały awatara), formatowanie dat i godzin po polsku.

---

## Jak to ma działać w teorii (koncepcja docelowa)

> Ta część opisuje **założenia produktu**, a nie to, co robi prototyp. W makiecie nic z poniższych punktów (poza zapisem potwierdzenia lokalnie) nie jest zaimplementowane.

### Idea

Seniorzy, którzy mieszkają sami, często nie chcą być „monitorowani”, ale ich bliscy chcą mieć pewność, że wszystko jest w porządku. Aplikacja ma być lekkim kompromisem: osoba starsza sama, jednym dotknięciem, daje znać, że dzień przebiega normalnie – bez kamer, czujników i śledzenia.

### Codzienny cykl

1. Rano użytkownik otwiera aplikację (lub dotyka przypomnienia) i naciska **Jestem OK**.
2. Aplikacja zapisuje datę i godzinę potwierdzenia oraz pokazuje ekran z podziękowaniem.
3. Bliscy mogą zobaczyć, że dzisiejsze potwierdzenie zostało wysłane.
4. Następnego dnia cykl zaczyna się od nowa.

### Gdy potwierdzenia brakuje

W wersji docelowej brak potwierdzenia mógłby uruchamiać łagodną ścieżkę eskalacji:

1. **Przypomnienie dla użytkownika** o wyznaczonej godzinie – spokojne, bez alarmującego tonu.
2. **Drugie przypomnienie** po ustalonym czasie.
3. **Powiadomienie wybranych bliskich** („Anna nie potwierdziła dzisiaj, że wszystko w porządku”), aby mogli zadzwonić i sprawdzić sytuację.

Godziny i liczba kroków powinny być konfigurowalne przez użytkownika lub jego opiekuna.

### Kontakt z bliskimi

- Lista **zaufanych kontaktów** jest krótka i wybrana przez użytkownika.
- Przycisk **Zadzwoń** od razu uruchamia połączenie telefoniczne, bez dodatkowych kroków.
- Dzwonić można także wtedy, gdy użytkownik nie czuje się dobrze – służy do tego ekran *Bliscy* i skrót *Skontaktuj się z bliskim* na ekranie głównym.
- Aplikacja **nie jest numerem alarmowym** i nie zastępuje pogotowia; powinna to jasno komunikować.

### Założenia dotyczące prywatności i zgody

- Użytkownik wie, kto otrzymuje informacje, i wyraża na to zgodę.
- Przesyłane są minimalne dane: tylko fakt i czas potwierdzenia, bez lokalizacji i bez danych zdrowotnych.
- Bliscy dołączają do kręgu zaufanych dopiero po akceptacji obu stron.

### Elementy, które musiałyby powstać

Konta i zaproszenia dla bliskich, backend przechowujący potwierdzenia, powiadomienia push lub SMS, harmonogram przypomnień oraz ustawienia godzin. W prototypie ich nie ma.

---

## Poza zakresem prototypu

Celowo nie ma tu: powiadomień, kont użytkowników, backendu, wysyłania informacji do rodziny, historii potwierdzeń ani edycji i usuwania kontaktów.

## Technologie

Jeden plik HTML z wbudowanym CSS i JavaScriptem (bez bibliotek i bez instalacji), ikony SVG, czcionka Inter z Google Fonts (z awaryjnym `system-ui`).

## Uruchomienie

Otwórz plik `index.html` w dowolnej nowoczesnej przeglądarce. Nie jest potrzebny serwer.

## Dostosowanie na potrzeby pokazu

W kodzie można szybko zmienić: imię użytkownika (`USER`), przykładowe kontakty (`DEFAULT_CONTACTS`), kolory (zmienne CSS w `:root`) oraz komunikat o wersji pokazowej (`NOTE`).
