;; name project ha6ps
;; name program ha6
;; name extension ps


prolog

:- use_module(library(clpfd)).

(defun use-module(library())
  (prolog_load_library(library))
  (prolog_load_library(clpfd))
  (prolog_load_library(clpz))
  (prolog_load_library(clpfd_fd))
  (prolog_load_library(clpfd_fd_lib))
  (prolog_load_library(clpfd_fd_lib_fd))
  (prolog_load_library(clpfd_fd_lib_fd_fd))
  (prolog_load_library(clpfd_fd_lib_fd_fd_fd)))


(defun make-constraints(vars, constraints)
  (maplist (lambda (var constraint)
            (assertz(var = constraint)))
          vars
          constraints))
          (make-constraints [x y z]
                         [('>=', x 3), ('<=', x 10),
                          ('>=', y 5), ('<=', y 15),
                          ('>=', z 2), ('<=', z 12)])
                          (make-constraints [x y z]
                          [('>=', x 3), ('<=', x 10),
                           ('>=', y 5), ('<=', y 15))


(defun solve-problem(constraints)
  (use-module(clpfd))
  (make-constraints vars constraints)
  (asserta((sum(vars) >= 20)))
  (asserta((sum(vars) <= 50)))
  (asserta((sum([x, y, z]) >= 10)))
  (asserta((sum([x, y, z]) <= 25)))
  (asserta((and (>= x y) (>= y z) (>= z x))))
  (asserta((and (<= x 6) (<= y 9) (<= z 12))))
  (solve([vars], (all_different(vars)),
   [sum(vars) >= 20, sum(vars) <= 50,]
   [sum([x, y, z]) >= 10, sum([x, y, z]) <= 25,]
   [(>= x y) (>= y z) (>= z x)],
   [(<= x 6) (<= y 9) (<= z 12)]))
   (format(terminal_out, "Solution: ~p~n", vars)))



(solve-problem
     [('>=', x 3), ('<=', x 10),
      ('>=', y 5), ('<=', y 15),
      ('>=', z 2), ('<=', z 12)])
      (solve-problem)


