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

;Aufgabe 2.1
;;<Notmeldung> ::= <Ueberschrift><Standort><Notfallart><Hilfeleistungen><Peilzeichen><Signatur><Sendeschluss>
;;<Ueberschrift> ::= <Notzeichen><Notzeichen><Notzeichen>"DELTA ECHO "<Name><Name><Name><Rufzeichen><Notzeichen><Name-buchstabiert><Rufzeichen>
;;<Notzeichen> ::= "MAYDAY"
;;<Name> ::= <Buchstabe> | <Buchstabe><Name>
;;<Buchstabe> ::= schreibichjetzthiernichtalleshin
;;<Rufzeichen> ::= <Buchstabe> | <Buchstabe><Leer><Rufzeichen>
;;<Leer> ::= " "
;;<Name-buchstabiert> ::= <Buchstabe> | <Buchstabe><Leer><Name-buchstabiert>
;;<Standort> ::= "Ort"
;;<Notfallart> ::= <Notfallzeit>"Notfallart"<Notfalldetails>
;;<Notfallzeit> ::= "Notfallzeit "<Ziffer><Ziffer><Ziffer><Ziffer><Zeitzone> | ""
;;<Ziffer> ::= "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9" | "0"
;;<Zeitzone> ::= "UTC" | "GMT" | whatever
;;<Notfalldetails> ::= "Details" | "Details"<Notfalldetails>| ""
;;<Hilfeleistungen> ::= "Hilfeleistungen" | "Hilfeleistungen"<Hilfeleistungen>
;;<Peilzeichen> ::= "Sende Peilzeichen" "- -"
;;<Signatur> ::= <Name><Rufzeichen>
;;<Sendeschluss> ::= "OVER" | "blubb"

;2.2
(define (headline shipname rufzeichen)
  (display (string-append "MAYDAY MAYDAY MAYDAY\n" (string->NATOStr "DE") "\n" shipname " " shipname " " shipname " " (string->NATOStr rufzeichen)
                          "\nMAYDAY " shipname " Ich buchstabiere " (string->NATOStr shipname) "\nRufzeichen " (string->NATOStr rufzeichen) "\n")))
(define (place ort)
  (display (string-append "Notfallposition " ort "\n")))

(define (emergency artNot)
  (display (string-append "Wir haben einen Notfall \n" artNot "\n")))

(define (furtherInstr hilfeLeist)
  (cond [(non-empty-string? hilfeLeist)(display (string-append "Wir benötigen folgende Hilfeleistungen \n" hilfeLeist))]
        [(display "Keine weiteren Angaben zu Hilfeleistungen")]))

(define (signature shipname rufzeichen)
  (display (string-append shipname " " (string->NATOStr rufzeichen))))

(define (notfallsignal shipname rufzeichen ort artNot hilfeLeist)
  (headline shipname rufzeichen)
  (place ort)(emergency artNot)(furtherInstr hilfeLeist)(display " ----\n")(signature shipname rufzeichen)(display "\nOVER"))

;2.3
;;Tests zu Seaside und Amira :
(define (test shipname)
  (cond [(string=? shipname "SEASIDE")(notfallsignal "SEASIDE" "SSDE" "UNGEFÄHR 10 SM NORDÖSTLICH LEUCHTTURM KIEL"
               "NOTFALLZEIT 1000 UTC \nSCHWERER WASSEREINBRUCH WIR SINKEN\nKEINE VERLETZTEN\nVIER MANN GEHEN IN DIE RETTUNGSINSEL"
               "SCHNELLE HILFE ERFORDERLICH\nICH SENDE DEN TRÄGER")])
  (cond [(string=? shipname "AMIRA")(notfallsignal "AMIRA" "AMRY" "57°46’N, 006°31’E"
               "NOTFALLZEIT 0640 UTC UTC \nKENTERUNG IN SCHWERER SEE\nNEUN MANN AN BORD\nDAS SCHIFF IST 15M LANG UND HAT EINEN GRÜNEN RUMPF"
               "")]))

