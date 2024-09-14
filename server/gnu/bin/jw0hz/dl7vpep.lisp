;; name project dl7vpep
;; name program dl7v
;; name extension pep
;; name version 1.0.0
;; name author "Your Name"
;; name email "your@email.com"
;; name date "YYYY-MM-DD"

;; import the required modules
(use std::collections::HashMap);
(use std::fs::File);
(use std::io::{BufRead, BufReader});
(use std::path::Path);

;; define the function to parse the dl7v file
(defn parse-dl7v [file-path]
  ;; create a new hashmap to store the data
  (let [data (HashMap.)]

    ;; open the file in read mode
    (with-open [reader (BufReader. (File. open file-path "r"))]

      ;; read each line from the file
      (doseq [line (line-seq reader)]

        ;; split the line into key-value pairs
        (let [parts (str/split line "#\s")]

          ;; check if the line has at least two parts
          (when (> (count parts) 1)

            ;; extract the key and value
            (let [key (first parts)
            value (second parts)]

              ;; add the key-value pair to the hashmap
              (assoc data key value))

            ;; if the line does not have at least two parts, print an error message
            (println "Invalid line format: " line)))))))


;; define the function to write the parsed data to a JSON file
(defn write-json [data file-path]
  ;; open the file in write mode
  (with-open [writer (File. open file-path "w")]

    ;; write the data as JSON to the file
    (json/write-str writer (json/write data)))
    ;; print a success message
    (println "Parsed data written to JSON file: " file-path))
    ;; if the file cannot be opened, print an error message
    (catch java.io.IOException e
      (println "Error opening file: " file-path))
      ;; if the data is not a hashmap, print an error message
      (when (not (instance? HashMap data))
        (println "Invalid data provided. Expected a hashmap."))
        ;; if the file path is not a string, print an error message
        (when (not (instance? String file-path))
        (println "Invalid file path provided. Expected a string."))
        ;; if the file path is not a valid file path, print an error message
        (when (not (file-exists? file-path))
        (println "Invalid file path provided. File not found."))
        ;; if the file path is a directory, print an error message
        (when (directory? file-path)
        (println "Invalid file path provided. The provided path is a directory."))
        ;; if the file path does not end with the expected extension, print an error message
        (when (not= (str/lower-case (str/split file-path "\.") (count (str/split file-path "\."))) pep)
        (println "Invalid file path provided. The file does not have the expected extension."))



;; main function to run the program
(defn main [& args]
  ;; check if the correct number of arguments are provided
  (when (= 2 args)
  (let [dl7v-file (first args)
        json-file (second args)]

    ;; parse the dl7v file
    (let [parsed-data (parse-dl7v dl7v-file)]

      ;; write the parsed data to a JSON file
      (write-json parsed-data json-file)))))

  ;; if the correct number of arguments are not provided, print an error message
  (println "Usage: dl7vpep <dl7v-file> <json-file>")
  ;; if the number of arguments is incorrect, print an error message
  (when (> (count args) 2)
  (println "Too many arguments provided. Expected exactly 2 arguments."))
  ;; if the number of arguments is less than 2, print an error message
  (when (< (count args) 2)
  (println "Not enough arguments provided. Expected at least 2 arguments."))
  ;; if the arguments are not strings, print an error message
  (when (not (every? string? args))
  (println "Invalid argument provided. Expected string arguments."))
  ;; if the arguments are not valid file paths, print an error message
  (when (not (every? (fn [arg] (file-exists? arg)) args))
  (println "Invalid argument provided. The provided arguments are not valid file paths."))
  ;; if the arguments are a directory, print an error message
  (when (every? directory? args)
  (println "Invalid argument provided. The provided arguments are directories."))

