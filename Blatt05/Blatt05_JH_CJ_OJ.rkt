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

(define (domRez in_list)
  (cond [(member car(in_list) pattern) sort(in_list pattern)]
        [(member car(in_list) color) sort(in_list color)]
        [(member car(in_list) antenna) sort(in_list antenna)]
        [(member car(in_list) wings) sort(in_list wings)]
        )
  )

(define (sort in_list feature)
  (cond [(> index-of(feature car(in_list)) index-of(feature cdr(in_list))) in_list]
        [else reverse(in_list)]
        )
  )

(define (index-of list element)
  (let loop ((list list)
             (x 0))
    (cond ((empty? list) #f)
          ((equal? (first list) element) x)
          (else (loop (rest list) (add1 x))))))
                                    