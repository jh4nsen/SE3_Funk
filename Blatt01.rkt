#lang racket
;Übungsgruppe 04 - Mittwoche 8:15-9:45
;Christopher Jarsembinski 6700490
;Julius Hansen 6455291
;Oleg Janke 6834837
;--- Aufgabe 1.1 ---
;G=Grad
(define (Bogen G)
  (* G (/ pi 180)))

;B=Bogenmaß
(define (Grad B)
  (/ B (/ pi 180)))

;--- Aufgabe 1.2 ---
;I=Input cos
(define (my-acos I)
  (Grad (atan (/ (sqrt (- 1 (sqr I))) I))))

;--- Aufgabe 1.3 ---
(define (NM->KM NM)
  (* NM 1.852))

;--- Aufgabe 2.1 ---
(define (winkelDG A AA B BB)
  (Grad (acos (+ (* (sin(Bogen A))(sin (Bogen B)))(* (cos (Bogen A))(cos (Bogen B))(cos (Bogen (- BB AA))))))))
 
(define (distanzAB A AA B BB)
   (NM->KM (* (winkelDG A AA B BB) 60)))
;--- Aufgabe 2.2 ---
;AR=AlphaWinkel
(define (AnfKurs A AA B BB)
  (let ([AR (Grad (acos (/ (- (sin (Bogen B))(* (cos (Bogen(winkelDG A AA B BB)))(sin (Bogen A))))(* (cos A)(sin (winkelDG A AA B BB))))))])
    (if (> (- BB AA) 0 ) AR (- 360 AR))))
;--- Aufgabe 2.3 ---
(define (Grad->Himmelsrichtung G)
  (case (+ G)
    [(and (<= 348.75)(> 11.25)) 'N]
    [(and (<= 11.25)(> 33.75)) 'NNE]
    [(and (<= 33.75)(> 56.25)) 'NE]
    [(and (<= 56.25)(> 78.75)) 'ENE]
    [(and (<= 78.75)(> 101.25)) 'E]
    [(and (<= 101.25)(> 123.75)) 'ESE]
    [(and (<= 123.75)(> 146.25)) 'SE]
    [(and (<= 146.25)(> 168.75)) 'SSE]
    [(and (<= 168.75)(> 191.25)) 'S]
    [(and (<= 191.25)(> 213.75)) 'SSW]
    [(and (<= 213.75)(> 236.25)) 'SW]
    [(and (<= 236.25)(> 258.75)) 'WSW]
    [(and (<= 258.75)(> 281.25)) 'W]
    [(and (<= 281.25)(> 303.75)) 'WNW]
    [(and (<= 303.75)(> 326.25)) 'NW]
    [(and (<= 326.25)(> 348.75)) 'NNW]))

;Oleg.Janke@hotmail.com
;5Janke@inf
    
