# racket-common-set-operations
A Racket program that implements a number of common set operations (functional programming practice)

## Tasks
For this lab, you will complete the following functions in Racket. Comment your functions well.

### Member? Function
Write a function ```member?``` that determines if an element ```e``` is part of list ```lst```. This function will return ```#t``` if ```e``` is a member of the list ```lst``` and ```#f``` otherwise. You may use common Racket functions (see list below). You may not use the built-in member function in your answer (see below). 
```
(define (member? e lst)
  ; complete this function definition
)
```
Your other function will rely on your member? function, so test it well.

### Set? Function
Write a function ```set?``` that checks whether its argument ```lst``` is a well-formed set, which is a set that contains no duplicates. Your function ```set?``` returns true ```#t``` or false ```#f``` accordingly. You may find it useful to make use of your ```member?``` function in your function.

Here are some examples of the expected behavior of ```set?```.
```
(set? '(x y z))       => #t 
(set? '(a 1 b 2 c 3)) => #t 
(set? '())            => #t ; empty set is a good set 
(set? '(6 2 2))       => #f ; duplicate, bad set 
(set? '(x y z x))     => #f ; duplicate, bad set
```
Complete the following definition of ```set?```.
```
(define (set? lst) 
  ; complete this function definition 
)
```
### Union Function
Write a function ```union``` that takes the set union of list ```lst1``` and list ```lst2``` and returns a list representing the mathematical union of the two lists. Your function does not need to work on embedded lists. You may use the functions you defined previously (```set?``` and ```member?```), if useful, in addition to common Racket functions. 
```
(define (union lst1 lst2)
  ; complete this function definition
)
```
### Intersect Function
Write a function ```intersect``` that takes the set intersection of list ```lst1``` and list ```lst2``` and returns a list representing the mathematical intersection of the two lists. Your function does not need to work on embedded lists. 
```
(define (intersect lst1 lst2)
  ; complete this function definition
)
```
### Difference Function
Write a function difference that takes the set ```difference``` of list ```lst1``` minus list ```lst2``` and returns a list representing the mathematical difference of the two lists. You do not need to implement a symmetric difference, only 
 . Your function does not need to work on embedded lists. 
```
(define (difference lst1 lst2)
  ; complete this function definition
)
```
### Flatten Function (Extra Credit)
Write a function flatten that takes two lists ```lst1```  and ```lst2``` and returns a new list that contains all elements in both lists, but eliminates any embedded lists while retaining the elements from those embedded lists. You may retain duplicates (or choose to eliminate them). You may freely use any of the functions you wrote for this lab.
```
(define (flatten lst1 lst2)
  ; complete this function definition
)
```
## Function Restrictions
The functions you implement for this lab are common set operations. These operations exist as functions in the language. For this lab, you may not use these built-in functions. You must write your functions from scratch using only those in the allowed functions list (as well as lots and lots of parentheses).

### Allowed Functions
You must complete this lab using only functions from this list, augmented by those you write yourself. You will use a subset of these functions and will not make use of all functions listed here.

* ```define```
* ```#t```, ```#f``` 
* ```car```, ```cdr```, ```cadr```, ... (etc.)
* ```first```, ```second```, ..., ```rest```, ```last```  
* ```cons```, ```append```
* ```eq?```, ```eqv?```, ```equal?```       
* ```pair?```, ```list?```
* ```null?```, ```null```, ```empty?``` 
* ```if```, ```cond```, ```else```     
### Prohibited Functions
You only need functions from the allowed list to complete this lab. The use of any other function is prohibited, including these functions that deal with sets.
* ```member```, ```memv```, ```memq```
```set-equal?```, ```set-eqv?```, ```set-eq?, set?```
```set```, ```seteqv```, ```seteq``` 
```set-member?```, ```set-add```, ```set-remove```, ```set-empty```? 
```set-count```, ```set-first```, ```set-rest```
```set-union```, ```set-first``` , ```set-rest```
```set-subtract```, ```set-symmetric-difference```
```seq=?```, ```subset?```, ```proper-subset?```, ```in-set``` 
## Output Format
Copy the following lines of code and paste them at the end of your program. This code reads lines from standard input and evaluates them. It terminates on end-of-input. This is necessary to work with the automatic tester. It is already provided in the (nearly) empty provided ```lab4.rkt```.
```
(define-namespace-anchor anc)
(define ns (namespace-anchor->namespace anc))
(let loop ()
  (define line (read-line (current-input-port) 'any))
  (if (eof-object? line)
    (display "")
    (begin (print (eval (read (open-input-string line)) ns)) (newline) (loop))))
```
