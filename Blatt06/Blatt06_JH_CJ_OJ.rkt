#lang racket

;Übungsgruppe 04 - Mittwoche 8:15-9:45
;Christopher Jarsembinski 6700490
;Julius Hansen 6455291
;Oleg Janke 6834837

;Aufgabe 1
;;Kopfstück: linear, da Ergebnis mittels cons vom Stack zusammengesetzt wird
;;Endstück: endrekursiv, da am Ende nur die übriggebliebene Restliste ausgegeben wird und das neue n nicht über den stack berechnet wird
;;Merge: baumrekursiv, da zwei rekursive Aufrufe ausgeführt werden, deren Stränge wieder zusammengeführt werden
;;merge-sort: insgesamt baumrekursiv, die aufrufe von kopf-/endstück sind endrekursive Aufrufe linear rekursiver Funktionen, der Aufruf von merge
;;ist baumrekursiv
;;alle 4 Beispiele verwenden direkte Rekursion, weil keine weitere Funktion verwendet wird, mit der eine Wechselwirkung zustande kommt
; Aufgabe 2
(require 2htdp/image)

;; Bildelemente

;;;Bilderrahmen

(define bilderrahmen (empty-scene 500 300 "black"))
(define himmel (empty-scene 1000 100 "blue"))

;;; Dreieck zur Orientierung

(define transparente-scene (rectangle 500 300 "solid" (color 0 0 0 0)))

;;; geschmueckter Weihnachtsbaum mit Farbketten

;;; Stamm
(define stamm (rectangle 10 20 "solid" "brown"))

;;; untester Part
(define lowest-level (add-curve (triangle 70 "solid" "green")
                                10 45 15 0
                                65 45 15 1
                                "red"))
;;; untesterer Part
(define lower-level (add-curve (triangle 50  "solid" "green")
                               5 35 5 0
                               50 35 10 1
                               "blue"))
;;; mittlerer Part
(define middle-level (add-curve (triangle 30 "solid" "green")
                                5 15 5 0
                                30 15 15 1
                                "gold"))
;;; obererpart
(define top-level (triangle 20 "solid" "green"))

;;; Krone
(define crown (star 12 "solid" "gold"))

;;; Zusammensetzen der Teile des Weihnachtsbaums
(define chirstmastree (
                          above crown
                          top-level
                          middle-level
                          lower-level
                          lowest-level
                          stamm))

;;; Geschenk erzeugen mit 3 verschiedenen Farben
(define (geschenk color1 color2 color3) 
                  (above/align "center"
                               (beside
                                (rotate 135 (ellipse 15 5 "outline" "gold"))
                                (flip-horizontal
                                 (rotate 135 (ellipse 15 5 "outline" "gold"))))
                               (underlay
                                (underlay (rectangle 40 35 "solid" (color color1 color2 color3))
                                          (rectangle 3 35 "solid" "gold"))
(rectangle 40 3 "solid" "gold"))))

;;; Weihnachtskugel mit 3 verschiedenen Farben
(define (weihnachtskugel color1 color2 color3)
  (above/align "center" 
               (ellipse 5 2 "solid" "gold")
               (underlay/xy
                (ellipse 12 12 "solid" (color color1 color2 color3))
                5 5
                (ellipse 5 5 "solid" "white"))))


;;; Schneemann 
(define schneemann (underlay/xy
  ;Hut
   (above/align "center"
      (rectangle 20 20 "solid" (color 70 50 50))
      (ellipse 50 3 "solid" (color 70 50 50))
   ;Kopf
   (underlay/xy
      (underlay/xy (ellipse 40 40 "solid" "white")
       7 12
      (ellipse 10 10 "solid" "black"))
       23 12
      (ellipse 10 10 "solid" "black"))
    ;Körper
    (underlay/xy
       (underlay/xy
         (ellipse 80 70 "solid" "white")
          37 17
         (ellipse 6 6 "solid" "black"))
          37 42
         (ellipse 6 6 "solid" "black"))
         (ellipse 110 100 "solid" "white"))
          47 50
     ;Nase
          (triangle/ssa 30 48 6 "solid" "orange")))


;; Stern der "leuchtet"
(define stern (underlay
               (star 17 "solid" (color 255 250 0 70))
               (radial-star 8 5 10 "solid" "orange")
(star 10 "solid" "yellow")))

;; Geschenkstapel über Rekursion erzeugen

(define (geschenk-stapel ebenen)
  (above/align "center"
               (geschenk (+ 100 (random 155)) (+ 100 (random 155)) (+ 100 (random 155)))
               (if (= ebenen 1)
                   (rectangle 1 1 "solid" (color 0 0 0 0))
                   (beside/align "center"
                                 (geschenk-stapel (- ebenen 1))
                                 (geschenk-stapel (- ebenen 1))))))
  
;; Das allgeeine Bild erzeugen
(define erzeuge-bild (
                      underlay
                      bilderrahmen
                      (place-image stern  50 35 transparente-scene)
                      (place-image stern  200 20 transparente-scene)
                      (place-image stern  400 40 transparente-scene)
                      (place-image stern  240 30 transparente-scene)
                      (place-image schneemann 100 180 transparente-scene)
                      (place-image (geschenk-stapel 2) 350 240 transparente-scene)
                      (place-image chirstmastree 250 180 transparente-scene)
                      (place-image (weihnachtskugel 0 100 200) 238 220 transparente-scene)
                      (place-image (weihnachtskugel 0 100 200) 253 170 transparente-scene )))

(print erzeuge-bild)