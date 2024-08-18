(define (ascending? s) (if (null? s) #t 
    (if (null? (cdr s))
    #t
    (if (> (car s) (car(cdr s)))
        #f
        (ascending? (cdr s))))))

(define (my-filter pred s)
    (cond ((null? s) nil)
          ((pred (car s)) (cons(car s)(my-filter pred (cdr s))))
          (else (my-filter pred (cdr s)))))

(define (interleave lst1 lst2) 
    (cond ((null? lst1) lst2)
          ((null? lst2) lst1)
          (else (cons (car lst1) (interleave lst2 (cdr lst1))))))

(define (no-repeats s)
  (define (helper lst seen)
    (cond
      ((null? lst) '())
      (else (let ((elem (car lst)))
              (if (null? (filter (lambda (x) (equal? x elem)) seen))
                  (cons elem (helper (cdr lst) (cons elem seen)))
                  (helper (cdr lst) seen))))))
  (helper s '()))