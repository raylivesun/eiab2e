;; name project yt4oe
;; name program yt4
;; name extension oe
;; description Download YouTube videos and convert them into other formats (MP3, MP4)

;; import required modules
(use 'cl-youtube)
(use 'cl-mp3)
(use 'cl-quicklisp-fileutils)

;; define the main function
(defun yt4oe (video-url output-format)
  ;; download the video
  (let ((video-id (cl-youtube:video-id video-url)))
  (with-temp-directory "yt4oe"
    (cl-youtube:download-video video-id)

    ;; convert the video to the desired format
    (case output-format
      ('mp3
       (with-open-file (output-file (concat (file-namestring (current-directory)) "/" (file-namestring video-id) ".mp3")) :direction :output
        (cl-mp3:convert video-id output-file))
       'mp4
       (with-open-file (output-file (concat (file-namestring (current-directory)) "/" (file-namestring video-id) ".mp4")) :direction :output
        (cl-quicklisp-fileutils:copy-file video-id output-file)))

    (format t "Converted ~A to ~A successfully~n" video-id output-format)))))

;; example usage
(yt4oe "https://www.youtube.com/watch?v=dQw4w9WgXcQ" 'mp3)


