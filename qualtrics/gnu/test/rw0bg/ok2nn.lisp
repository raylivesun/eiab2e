;; name project ok2nn
;; name program ok2
;; name extensions nn
;; name extensions ok
;; name version 1.0.0
;; name description "A simple neural network library in Scheme."
;; name authors "ok2nn"
;; name license "MIT"

(import (rnrs/vector) (rnrs/base) (rnrs/syntax))

;; Define the neural network structure
(define-struct neural-network (layers))

;; Define the activation functions
(define (sigmoid x) (/ 1 (1+ (expt - x 1))))
(define (relu x) (max 0 x))

;; Define the neural network layer structure
(define-struct neural-layer (units input-size activation-function))

;; Define the neural network layer forward propagation
(define (forward-propagation layer input)
  (let ((weights (vector-ref layer 0))
        (biases (vector-ref layer 1))
        (activation-function (vector-ref layer 2)))
        (let* ((dot-product (vector-map vector-scale input weights))
               (weighted-sum (vector-add dot-product biases))
               (activation (apply activation-function weighted-sum)))
               activation)))


;; Define the neural network forward propagation for the entire network
(define (forward-propagation network input)
  (let ((layers (vector-ref network 0)))
  (letrec ((propagate (lambda (layer input)
                        (forward-propagation layer input))))
    (map propagate layers input))))
    (last (map forward-propagation layers input))


;; Define the neural network backpropagation
(define (backpropagation network input target output-activation-function)
  (let ((layers (vector-ref network 0)))
  (let ((derivative-activation (vector-map (lambda (f) (lambda (x) (* (- (f x)) (f x))))) output-activation-function))
  (letrec ((propagate-backwards (lambda (layer)
                               (let ((weights (vector-ref layer 0))
                                     (biases (vector-ref layer 1))
                                     (activation-function (vector-ref layer 2))
                                     (next-layer (vector-ref layers (vector-index layers (vector-length layers) - 1))))
                                     (delta (if (null? next-layer)
                                                        (vector-map (lambda (x) (* (- x) (derivative-activation activation-function x))) output-error)
                                                        (let ((delta-next (backpropagation next-layer input-error derivative-activation))
                                                              (dot-product (vector-map vector-scale delta-next weights))
                                                              (delta-weights (vector-map vector-scale delta-next input))
                                                              (delta-biases (vector-map vector-scale delta next-layer))))
                                                              (list delta-weights delta-biases delta-next)))))))
                                                              (propagate-backwards layer)))))


  (let ((output-error (vector-map (lambda (actual expected) (- actual expected)) target output)))
    (propagate-backwards layers))
    (let ((weights (vector-ref (first layers) 0))
          (biases (vector-ref (first layers) 1))
          (activation-function (vector-ref (first layers) 2)))
          (delta-weights (vector-map (lambda (x) (* (- x) (derivative-activation activation-function x))) weights))
          (delta-biases (vector-map (lambda (x) (* (- x) (derivative-activation activation-function x))) biases))
          (delta-next (vector-map (lambda (x) (* (- x) (derivative-activation activation-function x))) output-error)))
          (delta-weights-sum (vector-map vector-add delta-weights delta-next))
          (delta-biases-sum (vector-map vector-add delta-biases delta-next))
          (list delta-weights-sum delta-biases-sum)


;; Define the neural network training function
(define (train network input target output-activation-function learning-rate)
  (let ((layers (vector-ref network 0)))
  (letrec ((propagate-backwards (lambda (layer)
                               (let ((weights (vector-ref layer 0))
                                     (biases (vector-ref layer 1))
                                     (activation-function (vector-ref layer 2))
                                     (next-layer (vector-ref layers (vector-index layers (vector-length layers) - 1))))
                                     (delta (if (null? next-layer)
                                                        (vector-map (lambda (x) (* (- x) (derivative-activation activation-function x))) output-error)
                                                        (let ((delta-next (backpropagation next-layer input-error derivative-activation))
                                                              (dot-product (vector-map vector-scale delta-next weights))
                                                              (delta-weights (vector-map vector-scale delta-next input))
                                                              (delta-biases (vector-map vector-scale delta next-layer))))
                                                              (list delta-weights delta-biases delta-next)))))))
                                                              (propagate-backwards layer))))
                                                              (let ((output-error (vector-map (lambda (actual expected) (- actual expected)) target output)))
                                                              (propagate-backwards layers))


  (let ((weights (vector-ref (first layers) 0))
          (biases (vector-ref (first layers) 1))
          (activation-function (vector-ref (first layers) 2)))
          (delta-weights (vector-map (lambda (x) (* (- x) (derivative-activation activation-function x))) weights))
          (delta-biases (vector-map (lambda (x) (* (- x) (derivative-activation activation-function x))) biases))
          (delta-next (vector-map (lambda (x) (* (- x) (derivative-activation activation-function x))) output-error)))
          (delta-weights-sum (vector-map vector-add delta-weights delta-next))
          (delta-biases-sum (vector-map vector-add delta-biases delta-next))
          (list delta-weights-sum delta-biases-sum)
          (new-weights (vector-map (lambda (w dw) (+ w (* learning-rate dw))) weights delta-weights-sum))
          (new-biases (vector-map (lambda (b db) (+ b (* learning-rate db))) biases delta-biases-sum))
          (new-network (neural-network (list (neural-layer new-weights new-biases activation-function))))

