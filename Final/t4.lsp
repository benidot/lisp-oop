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
    (sexo :initarg :sexo :type string :accessor a-sexo)
    (dono :initarg :dono :type pessoa :accessor a-dono)
    (chip :initarg :chip :type integer :accessor a-chip)))

(defclass gato (animal) ())
(defmethod barulho ((gato gato))
    (format t "~a esta miando~%" (a-nome gato)))
    
(defclass cachorro (animal) ())
(defmethod barulho ((cachorro cachorro))
    (format t "~a esta latindo~%" (a-nome cachorro)))

(defmethod adicionar-conta ((banco banco) (conta conta-bancaria))
    (push conta (b-contas banco))
    (format t "Conta ~a adicionada ao banco ~a~%" 
                                            (cb-numero conta) 
                                            (b-nome banco)))

(defmethod total-saldo ((banco banco))
  (let ((total 0.0))
    (dolist (conta (b-contas banco))
      (setf total (+ total (cb-saldo conta))))
    total))

(defmethod sacar ((conta conta-bancaria) valor)
    (if (>= (cb-saldo conta) valor)
        (progn 
            (setf (cb-saldo conta) (- (cb-saldo conta) valor))
            (format t "Saque de ~a realizado na conta ~a. Novo saldo: ~a~%" 
                                                                        valor 
                                                                        (cb-numero conta) 
                                                                        (cb-saldo conta)))
            (format t "Saldo insuficiente~%")))

(defmethod depositar ((conta conta-bancaria) valor)
    (setf (cb-saldo conta) (+ (cb-saldo conta) valor))
    (format t "~a depositado a conta ~a. Novo saldo: ~a~%" valor (cb-numero conta) (cb-saldo conta)))

(defmethod barulho ((animal animal))
    (format t "~a quer atencao~%" (a-nome animal)))

(defmethod falar ((pessoa pessoa) &rest texto)
  (format t "~a diz: ~{~a~^ ~}~%" (p-nome pessoa) texto))

(defvar *senua* (make-instance 'conta-bancaria
                                :nome "Senua"
                                :idade 21
                                :altura 1.70
                                :documento 193017
                                :nacionalidade "Brasil"
                                :numero 193017
                                :saldo 0.0
                                :nivel-vip 3))

(defvar *mimi* (make-instance 'gato 
                                :chip 3247838 
                                :sexo "Masculino"
                                :nome "mimi"
                                :dono *senua*))

(defvar *mel* (make-instance 'cachorro 
                                :chip 223322 
                                :sexo "Feminino"
                                :nome "mel"
                                :dono *senua*))
                                
(defvar *oli* (make-instance 'animal 
                                :chip 438923
                                :sexo "Masculino"
                                :nome "oli"
                                :dono *senua*))

(defvar *mainBanco* (make-instance 'banco
                                :nome "Putobras"
                                :id 149
                                :governamental t))

(adicionar-conta *mainBanco* *senua*)
(format t "Saldo total do banco ~a: ~a~%" (b-nome *mainBanco*) (total-saldo *mainBanco*))
(depositar *senua* 500.0)
(format t "Saldo total do banco ~a: ~a~%" (b-nome *mainBanco*) (total-saldo *mainBanco*))
(sacar *senua* 20.0)

(format t "Contas no banco ~a:~%" (b-nome *mainBanco*))
(dolist (conta (b-contas *mainBanco*))
    (format t "     Conta ~a de ~a tem saldo ~a~%" 
                                (cb-numero conta) 
                                (p-nome conta) 
                                (cb-saldo conta)))

(barulho *mimi*)
(barulho *mel*)
(barulho *oli*)
(falar *senua* "ola")