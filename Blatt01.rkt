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
  (let ([AR (Grad (acos (/ (- (sin (Bogen B))(* (cos (Bogen(winkelDG A AA B BB)))(sin (Bogen A))))(* (cos (Bogen A))(sin (Bogen(winkelDG A AA B BB)))))))])
    (if (> (- BB AA) 0 ) AR (- 360 AR))))
;--- Aufgabe 2.3.1 ---
;G = Grad
(define (Grad->Himmelsrichtung G)
  (cond
    [(and (>= G 348.75)(<= G 360.0)) 'N]
    [(and (>= G 0.0)(< G 11.25)) 'N]
    [(and (>= G 11.25)(< G 33.75)) 'NNE]
    [(and (>= G 33.75)(< G 56.25)) 'NE]
    [(and (>= G 56.25)(< G 78.75)) 'ENE]
    [(and (>= G 78.75)(< G 101.25)) 'E]
    [(and (>= G 101.25)(< G 123.75)) 'ESE]
    [(and (>= G 123.75)(< G 146.25)) 'SE]
    [(and (>= G 146.25)(< G 168.75)) 'SSE]
    [(and (>= G 168.75)(< G 191.25)) 'S]
    [(and (>= G 191.25)(< G 213.75)) 'SSW]
    [(and (>= G 213.75)(< G 236.25)) 'SW]
    [(and (>= G 236.25)(< G 258.75)) 'WSW]
    [(and (>= G 258.75)(< G 281.25)) 'W]
    [(and (>= G 281.25)(< G 303.75)) 'WNW]
    [(and (>= G 303.75)(< G 326.25)) 'NW]
    [(and (>= G 326.25)(< G 348.75)) 'NNW]))

;--- Aufgabe 2.3.2 ---
;R = Symbol 'N | 'E | 'SSE etc..
(define (Himmelsrichtung->Grad R)
  (cond
    [(eq? R 'N) 0]
    [(eq? R 'NNE) 22.5]
    [(eq? R 'NE) 45]
    [(eq? R 'ENE) 67.5]
    [(eq? R 'E) 90]
    [(eq? R 'ESE) 112.5]
    [(eq? R 'SE) 135]
    [(eq? R 'SSE) 157.5]
    [(eq? R 'S) 180]
    [(eq? R 'SSW) 202.5]
    [(eq? R 'SW) 225]
    [(eq? R 'WSW) 247.5]
    [(eq? R 'W) 270]
    [(eq? R 'WNW) 292.5]
    [(eq? R 'NW) 315]
    [(eq? R 'NNW) 337.5]))
    

    
