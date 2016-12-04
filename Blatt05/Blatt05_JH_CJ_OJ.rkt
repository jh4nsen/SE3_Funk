#lang racket
;Übungsgruppe 04 - Mittwoche 8:15-9:45
;Christopher Jarsembinski 6700490
;Julius Hansen 6455291
;Oleg Janke 6834837

;Aufgabe 1
;Analyse

;Schmetterlinge als Listendarstellung, merkmale als Tupel (Color 1, Color 2): schmetterling('(red,blue),'(stripes,curly),'(curved,straight),'(rhomb,hexagon)) etc.
;so sind die einzelnen merkmale einfach extrahierbar.
;Dominanz Funktion (define domRez ((merkmal 1,merkmal 2)) -> gibt liste sortiert zurück als: (Dominant, Rezessiv)
;zum strukturieren der Eingabe und vereinheitlichung für bearbeitung
;Kontrollfunktionen für die einzelnen merkmale (define color ((dominant,rezessiv))) ... (define wingform ((rhomb,hexagon)) etc.
;dadurch sind die kontrollfunktionen leicht umzudrehen für Kinderkontrolle.
;Darstellungsfunktion für abbildung

;Implementation

(define pattern(list "stars" "dots" "stripes"))
(define color(list "green" "red" "blue" "yellow"))
(define antenna(list "bend" "curly" "straight"))
(define wings(list "rhomb" "ellipse" "hexagon"))