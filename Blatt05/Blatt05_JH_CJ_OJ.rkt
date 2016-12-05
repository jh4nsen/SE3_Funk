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

(define pattern(list 'stars 'dots 'stripes))
(define color(list 'green 'red 'blue 'yellow))
(define antenna(list 'curved 'curly 'straight))
(define wings(list 'rhomb 'ellipse 'hexagon))

;Merkmaltupel sortieren - Ziel: (Dominant,Rezessiv)
(define (domRez in_list)
  (cond [(not(boolean?(member (list-ref in_list 0) pattern))) (sort in_list pattern)]
        [(not(boolean?(member (list-ref in_list 0) color))) (sort in_list color)]
        [(not(boolean?(member (list-ref in_list 0) antenna))) (sort in_list antenna)]
        [(not(boolean?(member (list-ref in_list 0) wings))) (sort in_list wings)]
        )
  )
;Hilfsfunktion für domRez
(define (sort in_list feature)
  (cond [(< (index-of feature (list-ref in_list 0)) (index-of feature (list-ref in_list 1))) in_list]
        [else (reverse in_list)]
        )
  )
;Hilffunktion für domRez
(define (index-of list element)
  (let loop ((list list)
             (x 0))
    (cond ((empty? list) #f)
          ((equal? (first list) element) x)
          (else (loop (rest list) (add1 x))))))

;Vererbung der Merkmale
;gibt ein zufälliges Listenelement zurück
(define (random-element in_list)
  (let ((len(length in_list)))
    (list-ref in_list (random len))
    )
  )


(require se3-bib/se3-bib/butterfly-module) ;TODO: pfad lokal fixen...

;Beispielschmetterlinge
(define ursel(list (list 'red 'blue)(list 'stars 'stripes)(list 'curly 'straight)(list 'ellipse 'hexagon)))
(define horst(list (list 'green 'green)(list 'dots 'stripes)(list 'curly 'curved)(list 'rhomb 'hexagon)))

;Erzeugt einen neuen Schmetterling, erwartet zwei Eltern als Listen von Listen
(define (mendel-uno father mother)
  (let ((child-color (list (random-element(list-ref father 0)) (random-element(list-ref mother 0))))
        (child-pattern (list (random-element(list-ref father 1)) (random-element(list-ref mother 1))))
        (child-antenna (list (random-element(list-ref father 2)) (random-element(list-ref mother 2))))
        (child-wings (list (random-element(list-ref father 3)) (random-element(list-ref mother 3))))
        )
    (show-butterfly (list-ref(domRez child-color)0)(list-ref(domRez child-pattern)0)(list-ref(domRez child-antenna)0)(list-ref(domRez child-wings)0))
    )
  )

(define (mendel-plural father mother number)

  )