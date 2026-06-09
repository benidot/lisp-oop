(defclass pessoa ()
    ((nome :initarg :nome :type string :accessor p-nome)
    (idade :initarg :idade :type integer :accessor p-idade)
    (altura :initarg :altura :type float :accessor p-altura)))

(defclass pessoa-legal (pessoa) 
    ((documento :initarg :documento :type integer :accessor p-pl-documento)
    (nacionalidade :initarg :nacionalidade :type string :accessor p-pl-nacionalidade)))

(defclass conta-bancaria (pessoa-legal) 
    ((numero :initarg :numero :type integer :accessor cb-numero)
    (saldo :initarg :saldo :type double-float :accessor cb-saldo)
    (nivel-vip :initarg :nivel-vip :type integer :accessor cb-nivel-vip)))

(defclass banco () 
    ((nome :initarg :nome :type string :accessor b-nome)
    (id :initarg :id :type int :accessor b-id)
    (governamental :initarg :governamental :type boole :accessor b-governamental)
    (contas :initarg :contas :initform nil :accessor b-contas)))

(defclass animal () 
    ((nome :initarg :nome :type string :accessor a-nome)
    (especie :initarg :especie :type string :accessor a-especie)
    (dono :initarg :dono :type pessoa :accessor a-dono)
    (chip :initarg :chip :type integer :accessor a-chip)))

(defmethod adicionar-conta ((banco banco) (conta conta-bancaria))
    (push conta (b-contas banco))
    (format t "Conta ~a adicionada ao banco ~a~%" 
                                            (cb-numero conta) 
                                            (b-nome banco)))

(defmethod sacar ((conta conta-bancaria) valor)
    (if (>= (cb-saldo conta) valor)
        (progn 
            (setf (cb-saldo conta) (- (cb-saldo conta) valor))
                (format t "Saque de ~a realizado na conta ~a. Novo saldo: ~a~%" valor (cb-numero conta) (cb-saldo conta)))
            (format t "Saldo insuficiente~%")))

(defmethod depositar ((conta conta-bancaria) valor)
    (setf (cb-saldo conta) (+ (cb-saldo conta) valor))
    (format t "~a depositado a conta ~a. Novo saldo: ~a~%" valor (cb-numero conta) (cb-saldo conta)))

(defmethod barulho ((animal animal))
    (format t "~a quer atencao~%" (a-nome animal)))

(defmethod falar ((pessoa pessoa) &rest texto)
    (format t "~a diz: ~a~%" (p-nome pessoa) texto))

(defvar *senua* (make-instance 'conta-bancaria
                                :nome "Senua"
                                :idade 21
                                :altura 1.70
                                :documento 193017
                                :nacionalidade "Brasil"
                                :numero 193017
                                :saldo 0.0
                                :nivel-vip 3))

(defvar *mimi* (make-instance 'animal 
                                :especie "gato" 
                                :chip 3247838 
                                :nome "mimi"
                                :dono *senua*))

(defvar *mainBanco* (make-instance 'banco
                                :nome "Putobras"
                                :id 149
                                :governamental t))

(adicionar-conta *mainBanco* *senua*)
(depositar *senua* 500.0)
(sacar *senua* 20.0)

(format t "Contas no banco ~a:~%" (b-nome *mainBanco*))
(dolist (conta (b-contas *mainBanco*))
    (format t "-- Conta ~a de ~a tem saldo ~a~%" 
                                        (cb-numero conta) 
                                        (p-nome conta) 
                                        (cb-saldo conta)))

; (format t "~c[2J" #\Esc)
(format t "~a ~a tem o chip ~a ~%" 
                            (a-especie *mimi*) 
                            (a-nome *mimi*) 
                            (a-chip *mimi*))
(format t "pessoa ~a tem ~a reais ~%" 
                            (p-nome *senua*) 
                            (cb-saldo *senua*))

(barulho *mimi*)
(falar *senua* "ola tenho uma mensagem quero que a oracle suma do universo")