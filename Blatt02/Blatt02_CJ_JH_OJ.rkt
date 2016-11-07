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

;2.4
(define (pi_recursive divisor max_divisor)
  (cond [(> divisor max_divisor) 0]
        [else (+ (/ 1 divisor)(* -1.0 (pi_recursive (+ divisor 2) max_divisor)))]))

(define (pi)
  (* (pi_recursive 1 100000) 4.0)) ;noch eine null mehr läuft erst mit 3GB speicher stabil

;die fakultaetsfunktion waechst wesentlich schneller an als die funktion "um 2 inkrementieren"
;somit ist die abschaetzung für die euler zahl schon nach den ersten dutzend iterationen stabil
;da nur noch geringe aenderungen zum endergebnis zuaddiert werden
;die abschaetzung fuer pi hingegen hat durch das wechselnde vorzeichen der terme ueber mehrere iterationen
;immer wieder starke ueber- bzw. unterschaetzungen, nach mehreren tausend durchlaeufen werden immer noch
;aenderungen an der (erst) dritten nachkommastelle ausgefuehrt

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

;3.1 'number, da die rechnung ausgefuert wird
;3.2 'boolean, da der unaere not operator alle zahlen >1 zu false auswertet
;3.3 'pair, da die drei elemente als geschachtelte pairs repraesentiert werden
;3.4 'list, da es sich um die leere (somit einfachste) liste handelt
;3.5 'procedure, because of the way it is
;3.6 'char, da sting-ref den char an stelle x eines strings zurueck gibt
;3.7 'procedure, da eine neue lambda-funktion mit input = output definiert wurde
;3.8 'procedure, weil ist eine
;3.9 'symbol, da das erste evaluieren von type-of in einer type-of ein symbol zurueck gibt, keine procedure