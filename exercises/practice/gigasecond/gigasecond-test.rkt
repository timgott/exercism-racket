#lang racket

(require "gigasecond.rkt")

(module+ test
  (require rackunit rackunit/text-ui racket/date))

(module+ test
  (define (make-datetime year month day hour minute second)
    (seconds->date (find-seconds second minute hour day month year #f)))

  (define suite
    (test-suite
     "gigasecond tests"

     (test-equal? "date only specification of time"
                  (add-gigasecond (make-datetime 2011 4 25 0 0 0))
                  (make-datetime 2043 1 1 1 46 40))

     (test-equal? "second test for date only specification of time"
                  (add-gigasecond (make-datetime 1977 6 13 0 0 0))
                  (make-datetime 2009 2 19 1 46 40))

     (test-equal? "third test for date only specification of time"
                  (add-gigasecond (make-datetime 1959 7 19 0 0 0))
                  (make-datetime 1991 3 27 1 46 40))

     (test-equal? "full time specified"
                  (add-gigasecond (make-datetime 2015 1 24 22 0 0))
                  (make-datetime 2046 10 2 23 46 40))

     (test-equal? "test full time with day roll over"
                  (add-gigasecond (make-datetime 2015 1 24 23 59 59))
                  (make-datetime 2046 10 3 1 46 39))))

  (run-tests suite))
