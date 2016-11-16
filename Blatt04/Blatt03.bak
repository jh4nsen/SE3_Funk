#lang racket

;Aufgabe
;1.1
(define alphabet2 (vector 'Alfa 'Bravo 'Charlie 'Delta 'Echo 'Foxtrott 'Golf 'Hotel 'India 'Juliet 'Kilo 'Lima 'Mike 'November 'Oscar 'Papa 'Quebec 'Romeo 'Sierra 'Tango 'Uniform 'Victor 'Whiskey
                         'X-Ray 'Yankee 'Zulu 'Nadazero 'Unaone 'Bissotwo 'Terrathree 'Kartefour 'Pantafive 'Soxisix 'Setteseven 'Oktoeight 'Novenine 'Decimal 'Stop))
(define alphabet (vector "Alfa" "Bravo" "Charlie" "Delta" "Echo" "Foxtrott" "Golf" "Hotel" "India" "Juliet" "Kilo" "Lima" "Mike" "November" "Oscar" "Papa" "Quebec" "Romeo" "Sierra" "Tango" "Uniform" "Victor" "Whiskey"
                         "X-Ray" "Yankee" "Zulu" "Nadazero" "Unaone" "Bissotwo" "Terrathree" "Kartefour" "Pantafive" "Soxisix" "Setteseven" "Oktoeight" "Novenine" "Decimal" "Stop"))


;Einfacher Vektor, weil ist einfach zu implementieren

;1.2
(define (char->NATO in_char)
  (cond [(char-alphabetic? in_char) (vector->values alphabet (- (char->integer in_char) 65) (- (char->integer in_char) 64))]
        [(char-numeric? in_char) (vector->values alphabet (- (char->integer in_char) 48) (- (char->integer in_char) 47))]
        [(char=? #\, in_char) (vector->values alphabet 44 45)]
        [(char=? #\. in_char) (vector->values alphabet 46 47)])
  )

;1.3
(define (char->uppercase in_char)
  (cond [(char-alphabetic? in_char) (char-upcase in_char)]
        [else in_char])
  )

;1.4
(define (string->NATO in_string)
  (cond [(non-empty-string? in_string)
        (let*([as_list (string->list in_string)])
           (cons (char->NATO(char->uppercase(car as_list))) (string->NATO (list->string (cdr as_list)))))]
        ['()]
        ))
(require racket/string)
(define (string->NATOStr in_string)
  (string-append*(cdr (append* (map (lambda (x) (list " " x))(string->NATO in_string))))))

(define (whyrecursion input)
  (char->NATO (char->uppercase input))
  )
;laeuft nicht, kein bock mehr

;2.1
(require se3-bib/flaggen-module)
(define flaggen (vector A B C D E F G H I J K L M N O P Q R S T U V W X Y Z Z0 Z1 Z2 Z3 Z4 Z5 Z6 Z7 Z8 Z9))
;siehe 1.1, einfach zu implementieren und addressieren

;2.2
(define (char->flagge in_char)
  (cond [(char-alphabetic? in_char) (vector->values flaggen (- (char->integer in_char) 65) (- (char->integer in_char) 64))])
  (cond [(char-numeric? in_char) (vector->values flaggen (- (char->integer in_char) 48) (- (char->integer in_char) 47))])
  )

;provides
(provide (all-defined-out))