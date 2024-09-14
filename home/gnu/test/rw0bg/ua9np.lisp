;; name project ua9np
;; name program ua9
;; name extension np


(module ua9np
  (use 'cl-ppcre)
  (use 'cl-ppcre-posix)

  ;; Define the structure for a UA9 file
  (defstruct ua9-file
    header
    entries)

  ;; Define the structure for a UA9 entry
  (defstruct ua9-entry
    id
    label
    offset
    length
    type
    data))

  ;; Function to read a UA9 file from a file
  (defun read-ua9-file (file-name)
    (with-open-file (file file-name :direction :input)))

    ;; Read the UA9 header
    (let ((header
           (read-binary-integer file 8 :little-endian t)))

      ;; Read the number of entries
      (let ((entry-count (read-binary-integer file 8 :little-endian t)))

        ;; Read the entries
        (let ((entries (make-array entry-count :element-type 'ua9-entry))
          (current-entry 0))

          ;; Loop through each entry
          (while current-entry < entry-count
            (let ((id (read-binary-integer file 8 :little-endian t))
              (label (read-sequence string file))))))))

            ;; Create a UA9 entry and store it in the array
            (aset entries current-entry
             (make-ua9-entry :id id :label label :offset (position label file) :length (length label) :type (read-binary-integer file 8 :little-
              :data (read-sequence string file)))
              :current-entry (1+ current-entry))
              ;; Move to the next entry
              (move-to-char (position label file) :start)
              ;; Return the UA9 file structure

              (return (make-ua9-file :header header :entries entries))

  ;; Function to write a UA9 file to a file
  (defun write-ua9-file (ua9-file file-name))
  (with-open-file (file file-name :direction :output)
    ;; Write the UA9 header
    (write-byte ua9-file.header file)

    ;; Write the number of entries
    (write-byte (length ua9-file.entries) file))

    ;; Write the entries
    (dolist (entry ua9-file.entries)
      ;; Write the entry ID
      (write-byte (ua9-entry.id entry) file))

