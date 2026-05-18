; a verdadeira pergunta é pqq eu fui escolher lisp se eu nunca fiz nada concreto nele mas vamo la ne

(defun hello-world ()
  (format t "Hello, World!~%"))

; hello.lisp
(defun factorial (n)
  (if (<= n 1) 1 (* n (factorial (- n 1)))))


(hello-world)
(format t "test~%")