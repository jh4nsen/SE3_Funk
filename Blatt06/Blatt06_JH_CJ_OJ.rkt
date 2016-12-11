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

