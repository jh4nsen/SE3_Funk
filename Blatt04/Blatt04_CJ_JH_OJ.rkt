#lang racket
;Übungsgruppe 04 - Mittwoche 8:15-9:45
;Christopher Jarsembinski 6700490
;Julius Hansen 6455291
;Oleg Janke 6834837

;Aufgabe 1
;1. (max (min 2 (- 2 5)) 0)  ->  0
;2. ’(+ (- 2 13) 11)  ->  ’(+ (- 2 13) 11)
;3. (cadr ’(Alle Jahre wieder))  ->  ’Jahre
;4. (cddr ’(kommt (das Weihnachtfest)))  ->  'Weihnachtsfest
;5. (cdadr ’(kommt (das . Weihnachtfest)))  ->  '()
;6. (cons ’Listen ’(ganz einfach und))  ->  '(Listen . (ganz einfach und))
;7. (cons ’Paare ’auch)  ->  '(Paare . auch)
;8. (equal? (list ’Racket ’Prolog ’Java) ’(Racket Prolog Java))  ->  #T
;9. (eq? (list ’Racket ’Prolog ’Java) (cons ’Racket ’(Prolog Java)))  ->  #F
;(require racket/include)
;(include "Blatt03.rkt")
(require "Blatt03.rkt")
(require se3-bib/tools-module)
;Aufgabe 2
(define (headline shipname rufzeichen)
  (display (string-append "MAYDAY MAYDAY MAYDAY\n" (string->NATOStr "DE") shipname " " shipname " " shipname " " (string->NATOStr rufzeichen)
                          "\nMAYDAY " shipname " " (string->NATOStr shipname) "\nIch buchstabiere " (string->NATOStr rufzeichen) "\n")))
(define (place)
  (display (string-append "Notfallposition:"(car(one-of '(" Bermuda Dreieck\n" " Leuchtturm Kiel\n" " Kap hoorn\n" " Freibad\n"))))))

(define (emergency artNot)
  (display (string-append "Wir haben einen Notfall! " artNot " ")))

(define (furtherInstr hilfeLeist)
  (cond [(non-empty-string? hilfeLeist) (display "Sonst keine Probleme.")]
        [(display  (string-append "Wir benötigen folgende Hilfeleistungen" hilfeLeist))]))

(define (signature shipname rufzeichen)
  (display (string-append shipname " " (string->NATOStr rufzeichen))))

(define (notfallsignal shipname rufzeichen artNot hilfeLeist)
  (headline shipname rufzeichen)
  (place)(emergency artNot)(furtherInstr hilfeLeist)(display "\n----\n")(signature shipname rufzeichen)(display "\nOVER"))