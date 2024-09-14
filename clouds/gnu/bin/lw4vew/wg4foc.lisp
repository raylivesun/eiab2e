;; name project wg4foc
;; name program wg4
;; name extension foc


;; description
;; This is a simple web server written in Common Lisp.
;; It listens on port 8080 and serves static files from a given directory.
;; It also supports WebSockets for real-time communication.


;; load required libraries
(in-package :cl-user)
(load "websockets.lisp")
(load "ring.lisp")
(load "ring/adapter/clack.lisp")
(load "ring/middleware/multipart-params.lisp")
(load "ring/middleware/gzip.lisp")
(load "ring/middleware/url-rewriter.lisp")
(load "ring/middleware/params-parser.json.lisp")
(load "ring/middleware/content-type-defaults.lisp")
(load "ring/middleware/content-type-negotiation.lisp")
(load "ring/middleware/proxy.lisp")
(load "ring/middleware/response-compression.lisp")
(load "ring/middleware/error-handler.lisp")
(load "ring/middleware/cache.lisp")
(load "ring/middleware/defaults.lisp")
(load "ring/middleware/logging.lisp")
(load "ring/middleware/session.lisp")
(load "ring/middleware/session/cookie.lisp")
(load "ring/middleware/session/memory.lisp")
(load "ring/middleware/session/signed-cookie.lisp")
(load "ring/middleware/session/encrypted-cookie.lisp")
(load "ring/middleware/session/database.lisp")
(load "ring/middleware/session/redis.lisp")
(load "ring/middleware/session/memcached.lisp")
(load "ring/middleware/session/file.lisp")
(load "ring/middleware/session/redis-store.lisp")
(load "ring/middleware/session/memcached-store.lisp")
(load "ring/middleware/session/file-store.lisp")
(load "ring/middleware/session/cookie-store.lisp")
(load "ring/middleware/session/signed-cookie-store.lisp")
(load "ring/middleware/session/encrypted-cookie-store.lisp")
(load "ring/middleware/session/database-store.lisp")
(load "ring/middleware/session/memcache-store.lisp")
(load "ring/middleware/session/redis-store.lisp")
(load "ring/middleware/session/memcached-store.lisp")
(load "ring/middleware/session/file-store.lisp")
(load "ring/middleware/session/cookie-store.lisp")
(load "ring/middleware/session/signed-cookie-store.lisp")
(load "ring/middleware/session/encrypted-cookie-store.lisp")
(load "ring/middleware/session/database-store.lisp")
(load "ring/middleware/session/memcache-store.lisp")
(load "ring/middleware/session/redis-store.lisp")
(load "ring/middleware/session/memcached-store.lisp")
(load "ring/middleware/session/file-store.lisp")
(load "ring/middleware/session/cookie-store.lisp")
(load "ring/middleware/session/signed-cookie-store.lisp")
(load "ring/middleware/session/encrypted-cookie-store.lisp")
(load "ring/middleware/session/database-store.lisp")
(load "ring/middleware/session/memcache-store.lisp")
(load "ring/middleware/session/redis-store.lisp")


;; define the server configuration
(defvar *server-config*
  ;; use gzip compression middleware
  (ring/middleware/gzip:wrap-gzip
   ;; use proxy middleware to forward requests to another server
   (ring/middleware/proxy:wrap-proxy
    ;; use content type negotiation middleware to automatically determine the appropriate content type
    (ring/middleware/content-type-negotiation:wrap-content-type-negotiation
     ;; use url rewriter middleware to rewrite URLs based on rules
     (ring/middleware/url-rewriter:wrap-url-rewriter
      ;; use params parser middleware to parse JSON request bodies
      (ring/middleware/params-parser/json:wrap-params-parser
       ;; use multipart params middleware to handle file uploads
       (ring/middleware/multipart-params:wrap-multipart-params
        ;; use logging middleware to log requests and responses
        (ring/middleware/logging:wrap-logging
         ;; use session middleware to manage user sessions
         (ring/middleware/session:wrap-session
          ;; use cookie store middleware to store session data in cookies
          (ring/middleware/session/cookie-store:wrap-cookie-store
           ;; use default middleware
           (ring/middleware/defaults:wrap-defaults
            ;; create a ring handler
            (lambda (request)
              ;; serve static files from the "public" directory
              (ring/response/file-response
               (merge-pathnames "public" (ring/url/resource-name request))
               :content-type (mime-type (file-extension (filename request))))))))))))
               ;; start the server on port 8080
               (ring/adapter/clack:start-server #P"localhost:8080" #'server-handler))))
               ;; define the server handler
               (defun server-handler (request)
                 ;; handle WebSocket connections
                 (when (websocket-connection-p request)
                   (let ((websocket (websocket-connection request)))
                    ;; handle incoming messages
                    (websocket:on-message websocket (lambda (message)
                                              ;; send a message back to the client
                                              (websocket:send websocket message)))
                    ;; handle disconnections
                    (websocket:on-close websocket (lambda (code reason)
                                              ;; log the disconnection
                                              (format t "~A ~A ~A~n" code reason request))))))
                                              ;; handle regular HTTP requests
                                              (ring/response/response request))


;; load the server
(server-config)
