; começando com objetos, ainda maluco mas ta começando a fazer sentido (eu acho)

(defclass pessoa () 
((nome :initarg :nome :accessor p-nome)
 (idade :initarg :idade :accessor p-idade)))

(defclass estudante (pessoa)
((matricula :initarg :matricula :accessor p-e-matricula)))

(defvar *teste* (make-instance 'pessoa 
                                :nome "Teste" 
                                :idade 30))

(defvar *teste2* (make-instance 'estudante 
                                :nome "Teste 2" 
                                :idade 20 
                                :matricula "193017"))

(format t "~a ~%" (p-nome *teste*))
(format t "~a ~%" (p-nome *teste2*))
(format t "~a ~%" (p-e-matricula *teste2*))