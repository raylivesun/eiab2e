;; name project lz73trc
;; name program lz73
;; name program trc
;; name author Ashley S. Johnson

;; description This program compresses and decompresses files using the LZ77 algorithm.

;; usage:
;;   lz73 <input_file> <output_file>
;;   trc <input_file> <output_file>

;; implementation

;; Constants
(define-constant MAX_CODE_LENGTH 12)
(define-constant MAX_DISTANCE 5000)
(define-constant MAX_BLOCK_SIZE 4096)

;; Types
(define-type Byte (unsigned-byte 8))
(define-type Code (vector Byte))
(define-type Distance (vector Byte))
(define-type Window (vector Byte))

;; Variables
(define window (make-vector MAX_BLOCK_SIZE))
(define code-table (make-vector MAX_CODE_LENGTH))
(define distance-table (make-vector MAX_DISTANCE))
(define bit-counter 0)
(define byte-counter 0)
(define current-code (make-vector MAX_CODE_LENGTH))
(define current-distance 0)
(define previous-byte (make-byte))
(define previous-distance 0)

;; Functions

;; Initialize the code and distance tables
(define (initialize-tables)
  (let ((i 0))
    (while (< i MAX_CODE_LENGTH)
     (let ((code (make-vector 1)))
       (vector-set! code 0 (make-byte i))
       (vector-set! code-table i code)
       (incf i 1)))
       (let ((i 0))
         (while (< i MAX_DISTANCE)
           (let ((distance (make-vector 1)))
           (vector-set! distance 0 (make-byte i))
           (vector-set! distance-table i distance)
           (incf i 1)))
           (initialize-tables))))


;; Read a byte from the input file
(define (read-byte input-file)
  (let ((byte (read-char input-file)))
    (unless (eof-object? byte)
      byte)))


;; Write a byte to the output file
(define (write-byte byte output-file)
  (write-char (char->integer byte) output-file))


;; Write a code to the output file
(define (write-code code output-file)
  (let ((i 0))
   (while (< i (vector-length code))
     (write-byte (vector-ref code i) output-file)
     (incf i 1)))
     (write-byte #\0 output-file))


;; Write a distance to the output file
(define (write-distance distance output-file)
  (let ((i 0))
   (while (< i (vector-length distance))
     (write-byte (vector-ref distance i) output-file)
     (incf i 1)))
     (write-byte #\0 output-file))


;; LZ77 compression
(define (compress input-file output-file)
  (initialize-tables)
  (set! bit-counter 0)
  (set! byte-counter 0)
  (set! current-code (make-vector MAX_CODE_LENGTH))
  (set! current-distance 0)
  (let ((byte (read-byte input-file)))
    (unless (eof-object? byte)
      (let ((match-length 0))
       (let ((match-distance 0))
         (let ((i 1))
           (while (and (<= i MAX_BLOCK_SIZE)
            (let ((next-byte (read-byte input-file)))
              (let ((distance (abs (- (vector-ref window i) byte))))
               (and (<= distance MAX_DISTANCE)
                (equal? next-byte (vector-ref window (- i distance)))))))
                (incf i 1)
                (incf match-length 1)
                (vector-set! current-code 0 (vector-ref window (- i match-length)))
                (vector-set! current-distance (vector-ref window (- i match-length))))))))
                (let ((match-code (vector-ref code-table match-length)))
                  (write-code match-code output-file)
                  (write-distance (vector-ref distance-table match-distance) output-file)
                  (write-byte byte output-file)
                  (vector-set! window i byte)
                  (incf byte-counter 1)
                  (incf bit-counter 8)
                  (when (> bit-counter 7)
                   (let ((byte (make-byte bit-counter)))
                     (vector-set! window 0 byte)
                     (write-byte byte output-file)
                     (set! bit-counter 0))))))


;; LZ77 decompression
(define (decompress input-file output-file)
  (initialize-tables)
  (set! bit-counter 0)
  (set! byte-counter 0)
  (set! current-code (make-vector MAX_CODE_LENGTH))
  (set! current-distance 0)
  (let ((byte (read-byte input-file)))
    (unless (eof-object? byte)
     (let ((match-length 0))
       (let ((match-distance 0))
         (let ((i 1))
         (while (and (<= i MAX_BLOCK_SIZE)
            (let ((next-byte (read-byte input-file)))
             (let ((distance (abs (- (vector-ref window i) byte))))
               (and (<= distance MAX_DISTANCE)
                (equal? next-byte (vector-ref window (- i distance)))))))
                (incf i 1)
                (incf match-length 1)
                 (vector-set! current-code 0 (vector-ref window (- i match-length)))
                 (vector-set! current-distance (vector-ref window (- i match-length))))))))
                 (let ((match-code (vector-ref code-table match-length)))
                   (write-code match-code output-file)
                   (write-byte (vector-ref current-code 0) output-file)
                   (vector-set! window i (vector-ref current-code 0))
                   (incf byte-counter 1)
                   (incf bit-counter 8)
                   (when (> bit-counter 7)
                    (let ((byte (make-byte bit-counter)))
                      (vector-set! window 0 byte)
                      (write-byte byte output-file)
                      (set! bit-counter 0))))))


;; Main program
(let ((input-file (open-input-file (car command-line-arguments)))
  (output-file (open-output-file (cadr command-line-arguments))))
  (let ((operation (string-downcase (caddr command-line-arguments))))
   (cond ((string= operation "compress") (compress input-file output-file))
         ((string= operation "decompress") (decompress input-file output-file))
         (else (display "Invalid operation. Use 'compress' or 'decompress'."
                      (newline)
                      (exit 0)))))
                       (close-input-file input-file)
                       (close-output-file output-file))
                       (exit 0)
