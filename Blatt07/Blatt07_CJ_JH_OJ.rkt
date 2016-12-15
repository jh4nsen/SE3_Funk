#lang racket

;Übungsgruppe 04 - Mittwoche 8:15-9:45
;Christopher Jarsembinski 6700490
;Julius Hansen 6455291
;Oleg Janke 6834837

;Aufgabe 1

;Rekursiv
(define (produkt1 liste mult)
  (cond [(null? liste) '()]
        [else (cons (* (car liste) mult) (produkt1 (cdr liste) mult))])
  )

;Endrekursiv   erg= '()
(define (produkt2 liste mult erg)
  (cond [(null? liste) erg]
        [else (produkt2 (cdr liste) mult (append erg (list(* (car liste) mult))))])
  )

;Höhere Ordnung
(define (produkt3 liste mult)
  (map (lambda (lists)(* lists mult)) liste ))

;Aufgabe 2