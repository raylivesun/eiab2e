;; name project ck6bf
;; name program ck6
;; name extension bf


;; Define the initial state of the program
(define initial-state
  (list
    ;; Set the initial grid to all zeros
    (make-vector 10 0)
    ;; Set the player's position to the center of the grid
    (list 0 5)
    ;; Set the score to 0
    (list 0)
    ;; Set the lives to 3
    (list 3)
    ;; Set the current level to 1
    (list 1)
    ;; Set the current difficulty to easy
    (list "easy")
    ;; Set the current speed to normal
    (list "normal")
    ;; Set the current direction to right
    (list "right")
    ;; Set the current fruit to an apple
    (list "apple")
    ;; Set the current fruit position to a random location
    (list (random 10) (random 10))
    ;; Set the current fruit score multiplier to 1
    (list 1)
    ;; Set the current power-up to nothing
    (list "nothing")
    ;; Set the current power-up position to a random location
    (list (random 10) (random 10))
    ;; Set the current power-up score multiplier to 1
    (list 1)
    ;; Set the current power-up duration to 0
    (list 0)
    ;; Set the current power-up activation time to 0
    (list 0)
    ;; Set the current power-up cooldown time to 0
    (list 0)
    ;; Set the current power-up activation status to inactive
    (list "inactive")
    ;; Set the current power-up activation message to ""
    (list "")
    ;; Set the current power-up activation sound to ""
    (list "")
    ;; Set the current power-up activation animation to ""
    (list "")
    ;; Set the current power-up activation animation frame to 0
    (list 0)
    ;; Set the current power-up activation animation speed to 1
    (list 1)
    ;; Set the current power-up activation animation direction to right
    (list "right")
    ;; Set the current power-up activation animation loop to true
    (list true)
    ;; Set the current power-up activation animation loop count to 0
    (list 0)))


;; Define the action for moving the player in the specified direction
(define (move-player direction initial-state)
  ;; Get the current state
  (let ([state initial-state]
        ;; Get the player's position
        [x y] (car (car (cdr state) 2))
        ;; Get the current direction
        [current-direction (car (cdr state) 3)])

    ;; Update the player's position based on the direction
    (if (= current-direction "right")
        ;; Move the player to the right
        (if (> x 9)
        ;; If the player reaches the right edge of the grid, wrap around to the left edge
            (list (car (cdr state) 0) y)
            (list (+ x 1) y))

        ;; Move the player to the left
        (if (< x 0)
        ;; If the player reaches the left edge of the grid, wrap around to the right edge
        (list 9 y)
            (list (- x 1) y)))

    ;; If the player reaches the top edge of the grid, wrap around to the bottom edge
    (if (> y 9)
        (list x 0)
        ;; If the player reaches the bottom edge of the grid, wrap around to the top edge
        (list x 9))

    ;; Otherwise, update the player's position as is
    state))