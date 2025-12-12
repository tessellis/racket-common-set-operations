#lang racket
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;     CS 381 - Programming Lab #4	;
;			         	;
;  < Tess Ellis >			;
;  < elliste@oregonstate.edu >	       	;
;			         	;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;         Racket Built-In Funcs                 ;
;                                               ;
; car: extracts the first element of a pair     ;
; cdr: returns the second element of a pair     ;
; cond: conditional clause                      ;
;                                               ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; determines if an element e is part of list lst
(define (member? e lst)
  (if (null? lst)
      #f
      (if (equal? e (car lst))
          #t
          (member? e (cdr lst))))               
)

; checks whether its argument lst is a well-formed set,
; which is a set that contains no duplicates
(define (set? lst) 
  (cond
    [(null? lst) #t]
    ; if duplicate found return f
    [(member? (car lst) (cdr lst)) #f]
    ; else checking recursively
    [else (set? (cdr lst))])
)

;  takes the set union of list lst1 and list lst2 and returns a
; list representing the mathematical union of the two lists
(define (union lst1 lst2)
  (cond
    [(null? lst1) lst2]
    ; if element in lst1 already in lst2, skip
    [(member? (car lst1) lst2) (union (cdr lst1) lst2)]
    ; else add to the fron of union
    [else (cons (car lst1) (union (cdr lst1) lst2))])
)

; takes the set intersection of list lst1 and list lst2 and returns a
; list representing the mathematical intersection of the two lists
(define (intersect lst1 lst2)
  (cond
    ; return empty list if empty
    [(null? lst1) '()]
    [(member? (car lst1) lst2)
     ; if car lst1 is in lst2 include in return list
     (cons (car lst1) (intersect (cdr lst1) lst2))]
    [else (intersect (cdr lst1) lst2)])
)

;  takes the set difference of list lst1 minus list lst2 and returns a
; list representing the mathematical difference of the two lists
(define (difference lst1 lst2)
   (cond
    ; return empty list if empty
    [(null? lst1) '()]
    [(member? (car lst1) lst2)
     (difference (cdr lst1) lst2)]
    ; else keep and continue through list1
    [else
     (cons (car lst1) (difference (cdr lst1) lst2))])
)

; EC: takes two lists lst1  and lst2 and returns a new list that contains all
; elements in both lists, but eliminates any embedded lists while retaining the
; elements from those embedded lists
(define (flatten lst1 lst2)
  (define (flatten_func lst)
    (cond
      [(null? lst) null]
      ; if lst is actually a list
      [(list? (car lst))
       ; append its elements
       (append (car lst) (flatten_func (cdr lst)))]
      [else
       ; else keep element and continue 
       (cons (car lst) (flatten_func (cdr lst)))]))
    (flatten_func (append lst1 lst2))
)


;;;;;;;;;;;;;;;;;
;  DO NOT EDIT  ;
;;;;;;;;;;;;;;;;;
; enables testing via piping in stdin
(define-namespace-anchor anc)
(define ns (namespace-anchor->namespace anc))
(let loop ()
  (define line (read-line (current-input-port) 'any))
  (if (eof-object? line)
    (display "")
    (begin (print (eval (read (open-input-string line)) ns)) (newline) (loop))))