(defclass person ()
  ((name :initarg :name :type string :accessor p-name)
    (age :initarg :age :type integer :accessor p-age)
    (sex :initarg :sex :type char :accessor p-sex)))

(defvar *senua* (make-instance 'person 
                            :name "Senua" 
                            :age 21 
                            :sex "F"))

(format t "~a~%" (p-name *senua*))