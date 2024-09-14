;; name project z24s
;; name program z24
;; name extension s4

;; description Z24 is a simple text-based adventure game.
;; The player navigates through a series of rooms, encountering various challenges and obstacles.

;; author
;;      - Jane Doe
;;      - John Doe

;; version 0.1.0

;; license MIT

;; dependencies
;;      - zelda-like-console
;;      - zelda-like-graphics
;;      - zelda-like-input

;; usage
;;      - Start the program
;;      - Use the arrow keys to move the player
;;      - Press the space bar to interact with objects or enemies

;; resources
;;      - rooms.txt: A text file containing descriptions of the rooms in the game
;;      - items.txt: A text file containing descriptions of the items in the game
;;      - enemies.txt: A text file containing descriptions of the enemies in the game

;; setup
(set-module-path "zelda-like-console" "zelda-like-graphics" "zelda-like-input")
(use-modules zelda-like-console zelda-like-graphics zelda-like-input)

;; define rooms
(define rooms
  (list
   (room "Entrance"
         "You find yourself in a dark, dimly lit room. There is a door to your left."
         (list (item "key" "A shiny key that may open the door.")))
         (room "Corridor"
         "You are in a long, narrow corridor. The air is heavy with the scent of decaying furniture."
         (list (enemy "goblin" "A foul-smelling goblin guards the entrance of the cave.")))
         (room "Cave"
         "You have entered a dark, narrow cave. The walls are lined with crumbling rock and moss."
         (list (item "sword" "A sharp, metal sword used by a powerful dragon."))
         (room "Dragon Room"
         "You have found the final chamber of the cave. A large, glowing dragon awaits you."
         (list (enemy "dragon" "A majestic dragon lurks in the heart of the cave. It looks hungry."))))
         (room "Exit"
         "Congratulations! You have escaped the cave and reached the exit. The sun is setting, casting a warm golden glow on the cave floor."
         (list (item "shield" "A protective shield made of shimmering gold.")))
         (room "Boss Room"
         "You have defeated the dragon and entered the final room. A powerful, ancient dragon lurks in the center of the room."
         (list (enemy "final boss" "A fearsome, ancient dragon lurks in the center of the room. It has been defeated, but its power will never be"
          (list (item "legendary sword" "A legendary sword that can restore your life to full. Use wisely!"))))))
          (room "End"
          "You have won the game! The sun has set, casting a warm golden glow on the cave floor. As you exit the cave, you feel a sense of accomplishment."
          (list (item "gold coin" "A small, golden coin that may be valuable to you. Keep it safe!"))))
          (define current-room (rooms 0))
          (define inventory (list))
          (define score 0)

          ;; define actions
          (define (move direction)
           (let ((new-room (find-room current-room direction)))
             (if new-room
               (set! current-room new-room)
               (print "You cannot move that direction."))))
               (display-room current-room)
               (display-inventory inventory)
               (display-score score)
               (newline)
               (when (eq? (room-description current-room) "Exit")
                 (print "Congratulations! You have escaped the cave and reached the exit.")
                 (exit))
                 (when (eq? (room-description current-room) "Boss Room")
                   (print "You have defeated the dragon and entered the final room.")
                   (set! score (add score 100))
                   (set! current-room (find-room current-room "exit"))))))
                   (define (interact item)
                    (let ((item-description (find-item current-room item)))
                      (if item-description
                       (set! inventory (remove item inventory))
                       (print (format "You picked up ~a." item))
                       (set! score (add score 10))
                       (set! current-room (find-room current-room "exit"))))
                       (define (fight enemy)
                        (let ((enemy-description (find-enemy current-room enemy)))
                          (if enemy-description
                           (set! inventory (remove enemy inventory))
                           (print (format "You defeated ~a!" enemy))
                           (set! score (add score 20))
                           (set! current-room (find-room current-room "exit"))))
                           (else (print "There is no ~a here." enemy)))))
                            (define (display-room room)
                             (print (room-description room)))
                             (define (display-inventory inventory)
                              (if inventory
                                (print "Inventory:")
                                (for ((item item inventory))
                                  (print (format " - ~a" item)))
                                (newline))
                                (else (print "You have no items in your inventory.")))
                                 (define (display-score score)
                                  (print (format "Score: ~a" score))))
                                  (define (find-room current-room direction)
                                   (let ((room-index (find-room-index current-room direction)))
                                     (if room-index
                                       (rooms room-index)
                                       (print "There is no room in that direction.")
                                       (void))))
                                       (define (find-room-index current-room direction)
                                        (let ((room-index (cond ((eq? direction "north") (1- (room-index current-room)))
                                         ((eq? direction "south") (+ (room-index current-room) 1))
                                         ((eq? direction "east") (+ (room-index current-room) 3))
                                         ((eq? direction "west") (- (room-index current-room) 3))
                                         (else nil))))
                                          (if room-index
                                            room-index
                                            (print "There is no room in that direction.")
                                            (void)))))
                                             (define (find-item current-room item)
                                              (let ((item-index (find-item-index current-room item)))
                                                (if item-index
                                                  (room-items current-room item-index)
                                                  (print "There is no ~a here." item)
                                                  (void))))
                                                  (define (find-item-index current-room item
                                                  (let ((item-index (cond ((eq? item "key") (room-items current-room 0))
                                                  ((eq? item "sword") (room-items current-room 3))
                                                  ((eq? item "shield") (room-items current-room 4))
                                                  ((eq? item "legendary sword") (room-items current-room 5))
                                                  (else nil))))
                                                   (if item-index
                                                     item-index
                                                     (print "There is no ~a here." item)
                                                     (void)))))
                                                      (define (find-enemy current-room enemy
                                                      (let ((enemy-index (find-enemy-index current-room enemy)))
                                                        (if enemy-index
                                                          (room-enemies current-room enemy-index)
                                                          (print "There is no ~a here." enemy)
                                                          (void)))))
                                                          (define (find-enemy-index current-room enemy
                                                          (let ((enemy-index (cond ((eq? enemy "goblin") (room-enemies current-room 0))
                                                          ((eq? enemy "dragon") (room-enemies current-room 1))
                                                          (else nil))))
                                                           (if enemy-index
                                                             enemy-index
                                                             (print "There is no ~a here." enemy)
                                                             (void)
                                                             (define (room-items room index)
                                                              (room-list room 2)
                                                              (list-ref (room-list room 2) index))
                                                              (define (room-enemies room index)
                                                              (room-list room 3)
                                                              (list-ref (room-list room 3) index))
                                                              (define (room-list room index)
                                                              (room-data room)
                                                              (list-ref (room-data room) index))
                                                              (define (room-data room)
                                                              (room-data (rooms 0))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
                                                              (define (find-room-index current-room direction))

  (define (find-item current-room item))

  (define (find-enemy current-room enemy))

  (define (room-items room index))
  (room-list room 2)
  (list-ref (room-list room 2) index))

  (define (room-enemies room index))
  (room-list room 3)
  (list-ref (room-list room 3) index))

  (define (room-list room index))
  (room-data room)
  (list-ref (room-data room) index))

  (define (room-data room)
  (room-data (rooms 0))))
  (define rooms '((["You are in a dark, narrow cave. The walls are made of crumbling stone. There is a path to the north.", "key", "legendary s"
 ["A goblin lurks in the shadows. It looks menacing.", "sword", "shield", "legendary sword"])])))
  (define inventory '())
  (define score 0)
  (define current-room 0)
  (display-room current-room)
  (newline)
  (while #t
   (let ((command (read-line "Enter your command: ")))
     (cond ((eq? command "quit") (display "Goodbye!" (exit)))
     ((eq? command "north") (find-room current-room "north"))
     ((eq? command "south") (find-room current-room "south"))
     ((eq? command "east") (find-room current-room "east"))
     ((eq? command "west") (find-room current-room "west"))
     ((eq? command "look") (display-room current-room))
     ((eq? command "inventory") (display-inventory inventory))
     ((eq? command "score") (display-score score))
     ((eq? command "take") (let ((item (read-line "What do you want to take? ")))
      (find-item current-room item)
          (set! inventory (cons item inventory)))
          (display (format "You picked up ~a." item))
          (newline))
          ((eq? command "fight") (let ((enemy (read-line "Who do you want to fight? ")))
           (find-enemy current-room enemy)
           (fight enemy)))))
           ((eq? command "use") (let ((item (read-line "What do you want to use? ")))
            (if (eq? item "key")
             (set! current-room (find-room current-room "exit"))
             (else (display "You can't use ~a." item)))
             (newline))
             ((else (display "I don't understand that command."))))))
             (newline))))))
             (newline)
             (newline)))))))



;; end




