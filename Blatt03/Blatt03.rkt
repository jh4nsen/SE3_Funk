#lang racket

;Aufgabe
;1.1
(define alphabet (vector 'Alfa 'Bravo 'Charlie 'Delta 'Echo 'Foxtrott 'Golf 'Hotel 'India 'Juliet 'Kilo 'Lima 'Mike 'November 'Oscar 'Papa 'Quebec 'Romeo 'Sierra 'Tango 'Uniform 'Victor 'Whiskey
                         'X-Ray 'Yankee 'Zulu 'Nadazero 'Unaone 'Bissotwo 'Terrathree 'Kartefour 'Pantafive 'Soxisix 'Setteseven 'Oktoeight 'Novenine 'Decimal 'Stop))
;Einfacher Vektor, weil ist einfach zu implementieren

;1.2
(define (char->NATO in_char)
  (cond [(char-alphabetic? in_char) (vector->values alphabet (- (char->integer in_char) 65) (- (char->integer in_char) 64))])
  (cond [(char-numeric? in_char) (vector->values alphabet (- (char->integer in_char) 48) (- (char->integer in_char) 47))])
  (cond [(char=? #\, in_char) (vector->values alphabet 44 45)])
  (cond [(char=? #\. in_char) (vector->values alphabet 46 47)])
  )

;1.3
(define (char->uppercase in_char)
  (cond [(char-alphabetic? in_char) (char-upcase in_char)]
        [else in_char])
  )

;1.4
