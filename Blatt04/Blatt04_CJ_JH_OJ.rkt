#lang racket
;Übungsgruppe 04 - Mittwoche 8:15-9:45
;Christopher Jarsembinski 6700490
;Julius Hansen 6455291
;Oleg Janke 6834837

;Aufgabe 1
;1. (max (min 5 (- 6 7)) 8)  ->  8
;2. ’(+ (- 11 13) 17)  ->  ’(+ (- 11 13) 17)
;3. (cadr ’(Alle Jahre wieder))  ->  ’Jahre
;4. (cddr '(kommt (das Christuskind))))  ->  '(Christuskind)
;5. (cons  'Auf '(die Erde nieder))  ->   'Auf . '(die Erde nieder))
;6. (cons 'Wo 'wir)  ->  '(wo . wir)
;7. (equal? (list 'Menschen 'sind) '(Menschen sind))  ->  #T
;8. (eq? (list 'Rudolph 'Das 'Rentier) (cons 'Rudolph '(Das Rentier)))  ->  #F
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

;3.1
;; Innere Reduktion: Terme werden hier von innen nach außen auswertet

;; Beispiel:
;;    (hoch4 (* 3 (+ 1 (hoch4 2))))
;; -> (hoch4 (* 3 (+ 1 (* 2 2 2 2))))
;; -> (hoch4 (* 3 (+ 1 16))))
;; -> (hoch4 (* 3 17))
;; -> (hoch4 51)
;; -> (* 51 51 51 51)
;; -> 6765201

;; Äußere Reduktion: Terme werden von außen nach innen ausgewertet

;;    (hoch4 (* 3 (+ 1 (hoch4 2))))
;; -> (* (* 3 (+ 1 (hoch4 2))) (* 3 (+ 1 (hoch4 2))) (* 3 (+ 1 (hoch4 2))) (* 3 (+ 1 (hoch4 2))))
;; -> (* (* 3 (+ 1 (* 2 2 2 2))) (* 3 (+ 1 (hoch4 2))) (* 3 (+ 1 (hoch4 2))) (* 3 (+ 1 (hoch4 2))))
;; -> (* (* 3 (+ 1 16)) (* 3 (+ 1 (hoch4 2))) (* 3 (+ 1 (hoch4 2))) (* 3 (+ 1 (hoch4 2))));; -> (* (* 3        17        ) (* 3 (+ 1  (hoch4 2) )) (* 3 (+ 1  (hoch4 2) )) (* 3 (+ 1  (hoch4 2) )))
;; -> (* 51 (* 3 (+ 1 (hoch4 2))) (* 3 (+ 1 (hoch4 2))) (* 3 (+ 1 (hoch4 2))))
;; -> (* 51 (* 3 (+ 1 (* 2 2 2 2))) (* 3 (+ 1 (hoch4 2))) (3 (+ 1 (hoch4 2)))
;; -> (* 51 (* 3 (+ 1 16)) (* 3 (+ 1 (hoch4 2))) (3 (+ 1 (hoch4 2))))
;; -> (* 51 (* 3 17) (* 3 (+ 1 (hoch4 2))) (* 3 (+ 1 (hoch4 2))))
;; -> (* 51 51 (* 3 (+ 1 (hoch4 2))) (* 3 (+ 1 (hoch4 2))))
;; -> (* 51 51 (* 3 (+ 1 (* 2 2 2 2))) (* 3 (+ 1 (hoch4 2))))
;; -> (* 51 51 (* 3 (+ 1 16)) (* 3 (+ 1 (hoch4 2))))
;; -> (* 51 51 (* 3 17) (* 3 (+ 1 (hoch4 2))))
;; -> (* 51 51 51 (* 3 (+ 1 (hoch4 2))))
;; -> (* 51 51 51 (* 3 (+ 1 (* 2 2 2 2))))
;; -> (* 51 51 51 (* 3 (+ 1 16)))
;; -> (* 51 51 51 (* 3 17))
;; -> (* 51 51 51 51)
;; -> 6765201

;3.2
;; Für Funktionen wird in Racket die innere Reduktion als Reduktionsstrategie angewendet, für Special forms hingegen wird 
;; in Racket äußere Reduktion verwendet.

;3.3
;; Wenn Alyssa versucht das Programm mit der Eigenen Funktion new-if zu benutzen, entsteht ein Fehler da für eigene Funtion
;; innere Reduktion angewendet wird und somit werden die 3 Argumente zuerst ausgewertet wodurch eine Endlosschleife im Else-clause
;; des faculty entsteht.
;; Mit einer special form lässt sich dies vermeiden, da zuerst die Abbruchbedingung geprüft wird bevor die Rekursion einsetzt.