;; name project e74lz
;; name program e74
;; name extension lz
(module e74lz
  ;; import modules
  (import "env" "print" (func $print (param i32)))
  (import "env" "putchar" (func $putchar (param i32)))
  (import "env" "read" (func $read (result i32)))
  (import "env" "write" (func $write (param i32)))
  (import "env" "malloc" (func $malloc (param i32) (result i32)))
  (import "env" "free" (func $free (param i32)))

  ;; declare memory segments
  (memory $memory (export "memory") 1)
  (global $input_ptr (export "input_ptr") (mut i32) (i32.const 0))
  (global $output_ptr (export "output_ptr") (mut i32) (i32.const 0)))

  ;; declare functions
  (func $init (export "_start")
    ;; initialize input and output pointers
    i32.store (mut $input_ptr) (i32.const 0)
    i32.store (mut $output_ptr) (i32.const 0)

    ;; call main function
    call $main)
    ;; terminate the program
    (i32.const 0)


