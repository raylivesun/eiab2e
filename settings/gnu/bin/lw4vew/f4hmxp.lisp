;; name project f4hmxp
;; name program f4h
;; name extension mxp

(module f4hmxp
  (import "mxp" mxp)
  (import "mxp/actions" mxp-actions)
  (import "mxp/chat" mxp-chat)
  (import "mxp/commands" mxp-commands)
  (import "mxp/events" mxp-events)
  (import "mxp/objects" mxp-objects)
  ;; Your code here
)
(module f4h
  (import f4hmxp)
  ;; Your code here
)

(module f4h-actions
  (import f4hmxp)
  ;; Your code here
)
(module f4h-chat
  (import f4hmxp)
  ;; Your code here
)

(module f4h-commands
  (import f4hmxp)
  ;; Your code here
)

(module f4h-events
  (import f4hmxp)
  ;; Your code here
  (import f4h-actions)
  (import f4h-chat)
  (import f4h-commands)
  ;; Your code here
)
(module f4h-objects
  (import f4hmxp)
  ;; Your code here
)


;; Your code here

(export-module f4h
  f4h-actions
  f4h-chat
  f4h-commands
  f4h-events
  f4h-objects
  ;; Your code here
)


;; Your code here

(export-module f4h-actions
  ;; Your code here
)

(export-module f4h-chat
  ;; Your code here
  (export-function chat-message)
  ;; Your code here
)

(export-module f4h-commands
  ;; Your code here
  (export-function process-command)
  ;; Your code here
)
(export-module f4h-events
  ;; Your code here
  (export-function handle-event)
  ;; Your code here
)
(export-module f4h-objects
  ;; Your code here
  (export-function create-object)
  ;; Your code here
)
;; Your code here

(export-function main
  ;; Your code here
)
(export-function init-mxp
  ;; Your code here
)


