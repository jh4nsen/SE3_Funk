#lang racket
;Übungsgruppe 04 - Mittwoche 8:15-9:45
;Christopher Jarsembinski 6700490
;Julius Hansen 6455291
;Oleg Janke 6834837

; Aufgabe 1

; 1. miau -> 'Plueschi  // Da einfache Variablenabfrage
; 2. katze -> 'Plueschi // Katze fragt miau ab und bekommt 'Plueschi
; 3. tiger -> 'miau // bekommt symbol von miau
; 4. (quote katze) -> 'katze // symbol von katze
; 5. (eval tiger) -> 'Plueschi // evaluiert 'miau => miau -> 'Plueschi
; 6. (eval katze) -> XXX // Error, weil Plueschi nicht ausführbar
; 7. (eval 'tiger) -> 'miau // führt tiger aus
; 8. (welcherNameGiltWo 'harry 'potter) -> 'harry // A -> C und C wird ausgegeben
; 9. (cdddr xs1) -> '(miau katze) // Der tail vom tail vom tail der liste
;10. (cdr xs2) -> '(plueschi) // Tail der Liste
;11. (cdr xs3) -> 'plueschi // Tail der Liste ausgwertet
;12. (eval (sqrt 3)) -> 1.73... // berechnet (sqrt 3)
;13. (eval '(welcherNameGiltWo 'tiger 'katze)) -> 'tiger //wertet einfach funktion aus mit eingabe 'tiger 'katze
;14. (eval (welcherNameGiltWo 'katze 'tiger)) -> 'Plueschi // wertet symbole aus ('katze 'tiger) gibt sie an funktion welcher.. weiter und gibt 'Plueschi zurueck

; Aufgabe 2
; 2.1
(define (fak n)
  (cond [(negative? n) (fak (* n -1))]
        [(= n 0) 1]
        [else (* n (fak (- n 1)))]
        ))
;2.2
(define (power r n)
  (cond [(= n 0) 1]
        [(odd? n) (* r (power r (- n 1)))]
        [else (sqr (power r (/ n 2)))]
        ))
;2.3
(define (euler lastFak denom)
  (cond [(< (/ denom lastFak) (/ 1 (power 10 1000))) 1]
        [else (+ (/ denom lastFak)(euler (* lastFak denom)(+ denom 1)))]))

(define (intEuler lF dn)
  (/ (* (power 10 1001)(euler lF dn)) 2))
; Aufgabe 3
(define (type-of x)
  (cond [(boolean? x) 'boolean]
        [(pair? x) 'pair]
        [(list? x) 'list]
        [(symbol? x) 'symbol]
        [(number? x) 'number]
        [(char? x) 'char]
        [(string? x) 'string]
        [(vector? x) 'vector]
        [(procedure? x) 'procedure]))
