
(in-package #:eratosthenes)

;; Rough radius of the earth at 39 degrees from the equator.
(defparameter *radius-of-earth* 3961)

(defclass coordinate ()
  ((latitude :initarg :lat
             :accessor coordinate-latitude)
   (longitude :initarg :lon
              :accessor coordinate-longitude)))

(defgeneric distance (first second))

(defmethod distance ((first coordinate) (second coordinate))
  (labels ((number-to-radians (number)
             (* number (/ 3.142 180))))
    (let* ((lat-1-radians (number-to-radians (coordinate-latitude first)))
           (lat-2-radians (number-to-radians (coordinate-latitude second)))

           (dist-1 (number-to-radians (- (coordinate-latitude second) (coordinate-latitude first))))
           (dist-2 (number-to-radians (- (coordinate-longitude second) (coordinate-longitude first))))

           (doom  (+ (* (sin (/ dist-1 2))
                        (sin (/ dist-1 2)))

                     (* (* (cos lat-1-radians)
                           (cos lat-2-radians))
                        
                        (* (sin (/ dist-2 2))
                           (sin (/ dist-2 2)))))))
      (* *radius-of-earth* (* 2 (atan (sqrt doom) (sqrt (- 1 doom))))))))

;; (let ((a (make-instance 'coordinate :lat 38.898556 :lon -77.037852))
;;       (b (make-instance 'coordinate :lat 47.0968274 :lon -122.3383251)))
;;   (distance a b))
