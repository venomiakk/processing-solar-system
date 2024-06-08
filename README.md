# processing-solar-system

## wymagania do projektu

Stwórz trójwymiarowy, animowany układ planetarny składający się z gwiazd, planet i księżyców. Każde z ciał niebieskich musi być prymitywem 3D lub wczytaną bryłą ze zdefiniowanym własnym kolorem lub teksturą. W projekcie wykorzystaj różne rodzaje świateł, które oświetlą scenę oraz dadzą efekt świecącej gwiazdy i świecącego reflektora ze statku kosmicznego.

Dodaj możliwość eksploracji całego układu planetarnego. Stwórz statek kosmiczny, którym można przemieszczać się po scenie i oglądać ciała niebieskie z jego perspektywy. W ten sposób powstaną dwa tryby oglądania układu planetarnego: widok ogólny i widok ze statku kosmicznego. Nawigacja statkiem kosmicznym musi być zrealizowana za pomocą klawiatury i myszki.

Dodatkowo wprowadź własną interakcję do projektu, która w ciekawy sposób go rozwinie.

- Stworzenie trójwymiarowego układu planetarnego składającego się z:

  - [x] 1 gwiazdy,
  - [x] co najmniej 4 planet,
  - [x] co najmniej 7 księżyców poruszających się wokół co najmniej 3 planet.

- Zanimowanie układu planetarnego:

  - [x] planety muszą obracać się dookoła własnej osi,
  - [x] planety muszą poruszać się po swoich orbitach dookoła gwiazdy,
  - [x] księżyce muszą krążyć po swoich orbitach wokół planet.

  W związku z tym muszą mieć one zdefiniowane różne promienie orbit, **_kąty nachylenia swoich osi obrotu_** (?) oraz prędkości.

- Wykorzystanie obiektów 3D:

  - [x] użycie wszystkich prymitywów 3D (sfera i sześcian) razem z ich modyfikacją (np. prostopadłościan) dla ciał niebieskich,
  - [x] zaimportowanie co najmniej 1 obiektu 3D z pliku zewnętrznego dla ciał niebieskich,
  - [ ] zbudowanie statku kosmicznego z co najmniej 2 prymitywów 3D lub zaimportowanie obiektu 3D z pliku zewnętrznego.

- Zdefiniowanie wyglądu obiektów 3D:

  - [x] ciała niebieskie i statek kosmiczny muszą mieć własny materiał określony przez **_ambient_**, **_specular_**, **_shininess_** i **_emissive_**,
  - [x] gwiazda musi wyglądać, jakby świeciła,
  - [x] przynajmniej 1 obiekt 3D w projekcie musi być otekturowany.

- Ustawienie oświetlenia w scenie w taki sposób, aby:

  - [x] obiekty układu planetarnego były widoczne (światło otoczenia),
  - [x] gwiazda świeciła (światło punktowe),
  - [ ] statek kosmiczny posiadał reflektor świecący przed siebie (światło reflektorowe).

- Zdefiniowanie 2 trybów oglądania układu planetarnego:

  - [ ] widok ogólny z boku, gdzie można obserwować działanie całego układu planetarnego,
  - [ ] widok z perspektywy statku kosmicznego, gdzie razem z ruchem statku zmienia się to, co widzimy.

- Dodanie interakcji do projektu:

  - [ ] przełączanie się pomiędzy 2 trybami oglądania układu planetarnego, np. poprzez wciśnięcie wybranego klawisza na klawiaturze,
  - [ ] poruszanie się i obracanie statkiem kosmicznym przy wykorzystaniu klawiatury i myszki,
  - [ ] własny pomysł, który w ciekawy sposób rozwinie zrealizowane wymagania, np. możliwość strzelania ze statku kosmicznego czy "umieranie", kiedy statek kosmiczny zderzy się z planetą.
