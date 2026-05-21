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

(defclass animal () 
    ((nome :initarg :nome :type string :accessor a-nome)
    (especie :initarg :especie :type string :accessor a-especie)
    (dono :initarg :dono :type pessoa :accessor a-dono)
    (chip :initarg :chip :type integer :accessor a-chip)))

(defvar *senua* (make-instance 'conta-bancaria
                                :nome "senua"
                                :idade 21
                                :altura 1.70
                                :documento 193017
                                :nacionalidade "Brasil"
                                :numero 193017
                                :saldo 999.999
                                :nivel-vip 3))

(defvar *mimi* (make-instance 'animal 
                                :especie "gato" 
                                :chip 3247838 
                                :nome "mimi"
                                :dono *senua*))

(format t "~c[2J" #\Esc)
(format t "--- OUTPUT --- ~%")
(format t "~a ~a tem o chip ~a ~%" 
            (a-especie *mimi*) 
            (a-nome *mimi*) 
            (a-chip *mimi*))
(format t "pessoa ~a tem ~a reais ~%" 
            (p-nome *senua*) 
            (cb-saldo *senua*)) ; sintaxe maluca