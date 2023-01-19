(defclass Circle
	(is-a USER)
	(role concrete)
	(slot M3
		(type INTEGER)
		(range 0 32)
		(create-accessor read-write))
	(slot input_1
		(type INTEGER)
		(range 0 32)
		(create-accessor read-write))
	(slot input_2
		(type INTEGER)
		(range 0 32)
		(create-accessor read-write))
	(slot input_3
		(type INTEGER)
		(range 0 32)
		(create-accessor read-write))
	(slot OUT
		(type INTEGER)
		(range 0 32)
		(create-accessor read-write))
	(slot number
		(type INTEGER)
		(create-accessor read-write))
	(slot input_4
		(type INTEGER)
		(range 0 32)
		(create-accessor read-write))
	(slot M1
		(type INTEGER)
		(range 0 32)
		(create-accessor read-write))
	(slot M2
		(type INTEGER)
		(range 0 32)
		(create-accessor read-write)))

(defclass System
	(is-a USER)
	(role concrete)
	(slot name_
		(type STRING)
		(create-accessor read-write)))

(defclass Circuit
	(is-a System)
	(role concrete))

(defclass Adder
	(is-a Circuit)
	(role concrete)
	(slot in1
		(type INSTANCE)
		(allowed-classes Sensor Input)
		(create-accessor read-write))
	(slot in2
		(type INSTANCE)
		(allowed-classes Input Sensor)
		(create-accessor read-write))
	(slot output
		(type INTEGER)
		(range 0 32)
		(create-accessor read-write))
	(slot output_msb
		(type INTEGER)
		(range 0 16)
		(create-accessor read-write))
	(slot out
		(type INSTANCE)
		(allowed-classes Sensor)
		(create-accessor read-write))
	(slot is-calculated
		(type SYMBOL)
		(allowed-symbols no yes)
		(default ?DERIVE)))

(defmessage-handler Adder calculate-output-adder primary (?inp1 ?inp2 )
	(mod (+ ?inp1 ?inp2) 32)
)

(defmessage-handler Adder calculate-output-msb-adder primary (?inp1 ?inp2 )
	(mod (+ ?inp1 ?inp2) 16)
)

(defclass Multiplier
	(is-a Circuit)
	(role concrete)
	(slot in2
		(type INSTANCE)
		(allowed-classes Input Sensor)
		(create-accessor read-write))
	(slot in1
		(type INSTANCE)
		(allowed-classes Input Sensor)
		(create-accessor read-write))
	(slot output
		(type INTEGER)
		(range 0 32)
		(create-accessor read-write))
	(slot output_msb
		(type INTEGER)
		(range 0 16)
		(create-accessor read-write))
	(slot out
		(type INSTANCE)
		(allowed-classes Sensor)
		(create-accessor read-write))
	(slot is-calculated
		(type SYMBOL)
		(allowed-symbols no yes)
		(default ?DERIVE)))

(defmessage-handler Multiplier calculate-output-multi primary (?inp1 ?inp2 )
	(mod (* ?inp1 ?inp2) 32)
)
(defmessage-handler Multiplier calculate-output-msb-multi primary (?inp1 ?inp2 )
	(mod (* ?inp1 ?inp2) 16)
)
(defclass Sensor
	(is-a System)
	(role concrete)
	(slot value
		(type INTEGER)
		(range 0 32)
		(create-accessor read-write))
	(slot output
		(type INTEGER)
		(range 0 32)
		(create-accessor read-write))
	(slot sensor_value_from_multiplier
		(type INSTANCE)
		(allowed-classes Multiplier)
		(create-accessor read-write))
	(slot sensor_value_from_adder
		(type INSTANCE)
		(allowed-classes Adder)
		(create-accessor read-write)))

(defclass Output
	(is-a Sensor)
	(role concrete))

(defclass Input
	(is-a System)
	(role concrete)
	(slot value
		(type INTEGER)
		(range 0 32)
		(create-accessor read-write)))



(deftemplate goal
	(slot phase
		(type SYMBOL)
		(allowed-symbols initialise calc-output find-discrepancy)
		(default ?DERIVE))

	(slot iteration
		(type INTEGER) 
		(range 1 ?VARIABLE))
)

(definstances facts

([Time1] of  Circle

	(input_1 21)
	(input_2 28)
	(input_3 10)
	(input_4 25)
	(M1 10)
	(M2 24)
	(M3 26)
	(number 1)
	(OUT 18))

([Time2] of  Circle

	(input_1 7)
	(input_2 25)
	(input_3 13)
	(input_4 15)
	(M1 0)
	(M2 0)
	(M3 3)
	(number 2)
	(OUT 3))

([Time3] of  Circle

	(input_1 11)
	(input_2 17)
	(input_3 24)
	(input_4 31)
	(M1 22)
	(M2 6)
	(M3 8)
	(number 3)
	(OUT 14))

([Time4] of  Circle

	(input_1 18)
	(input_2 11)
	(input_3 28)
	(input_4 21)
	(M1 4)
	(M2 12)
	(M3 12)
	(number 4)
	(OUT 0))

([Time5] of  Circle

	(input_1 25)
	(input_2 24)
	(input_3 30)
	(input_4 10)
	(M1 18)
	(M2 16)
	(M3 12)
	(number 5)
	(OUT 12))

([Time6] of  Circle

	(input_1 12)
	(input_2 19)
	(input_3 11)
	(input_4 19)
	(M1 8)
	(M2 24)
	(M3 17)
	(number 6)
	(OUT 9))

([Time7] of  Circle

	(input_1 1)
	(input_2 31)
	(input_3 7)
	(input_4 22)
	(M1 2)
	(M2 0)
	(M3 26)
	(number 7)
	(OUT 26))

([Time8] of  Circle

	(input_1 0)
	(input_2 31)
	(input_3 3)
	(input_4 23)
	(M1 0)
	(M2 0)
	(M3 0)
	(number 8)
	(OUT 0))

([Time9] of  Circle

	(input_1 31)
	(input_2 1)
	(input_3 6)
	(input_4 8)
	(M1 30)
	(M2 30)
	(M3 0)
	(number 9)
	(OUT 30))

([Time10] of  Circle

	(input_1 6)
	(input_2 4)
	(input_3 25)
	(input_4 12)
	(M1 12)
	(M2 31)
	(M3 12)
	(number 10)
	(OUT 28))

([input1] of  Input

	(name_ "In_1")
	(value 21))

([input2] of  Input

	(name_ "In_2")
	(value 28))

([input3] of  Input

	(name_ "In_3")
	(value 10))

([input4] of  Input

	(name_ "In_4")
	(value 25))

([M1] of  Multiplier

	(in1 [input2])
	(in2 [S1])
	(out [S2])
	(name_ "Π1"))

([M2] of  Multiplier

	(in1 [input3])
	(in2 [input4])
	(out [S3])
	(name_ "Π2"))

([S1] of  Sensor

	(name_ "M1")
	(value 10)
	(sensor_value_from_adder [A1])
	)

([S2] of  Sensor

	(name_ "M2")
	(value 24)
	(sensor_value_from_multiplier [M1])
	)

([S3] of  Sensor

	(name_ "M3")
	(value 26)
	(sensor_value_from_multiplier [M2])
	)

([A1] of  Adder

	(in1 [input1])
	(in2 [input1])
	(out [S1])
	(name_ "A1"))

([A2] of  Adder

	(in1 [S3])
	(in2 [S2])
	(out [OUT])
	(name_ "A2"))

([OUT] of  Output

	(name_ "OUT")
	(value 18)
	(sensor_value_from_adder [A2])
	)
)

(deffunction update_circle (?input1 ?input2 ?input3 ?input4 ?s1 ?s2 ?s3 ?out)
	(modify-instance [input1]
	(value ?input1))
;	(send [input1] print)

	(modify-instance [input2]
	(value ?input2))
;	(send [input2] print)

	(modify-instance [input3]
	(value ?input3))
;	(send [input3] print)

	(modify-instance [input4]
	(value ?input4))
;	(send [input4] print)

	;sensors
	(modify-instance [S1]
	(value ?s1))
;	(send [S1] print)
	 
	(modify-instance [S2]
	(value ?s2))
;	(send [S2] print)

	(modify-instance [S3]
	(value ?s3))
;	(send [S3] print)

	;output
	(modify-instance [OUT]
	(value ?out))
;	(send [OUT] print)
;	(printout t crlf)
)



(defrule inits
=>
	(assert (goal (iteration 1) (phase initialise)))
)

(defrule next_circle
	?x <- (goal (iteration ?i) (phase initialise))
=>
	(do-for-all-instances
		((?circle Circle))
		(= ?circle:number ?i) 
		;M1, M2, M3 are the three sensors here 
		(update_circle ?circle:input_1 ?circle:input_2 ?circle:input_3 ?circle:input_4 ?circle:M1 ?circle:M2 ?circle:M3 ?circle:OUT) 
	)
	(modify ?x  (phase calc-output))
)


(defrule calc-outputs-adder
	(goal (phase calc-output))
	(object (is-a Adder) (name ?c) (is-calculated no)
		(in1 ?inp-sys1)
		(in2 ?inp-sys2))
	(object (is-a System) (name ?inp-sys1) (value ?inp-val1))
	(object (is-a System) (name ?inp-sys2) (value ?inp-val2))
 =>
	(modify-instance ?c
		(is-calculated yes)
		(output (send ?c calculate-output-adder ?inp-val1 ?inp-val2))
		(output_msb (send ?c calculate-output-msb-adder ?inp-val1 ?inp-val2)))
;	(send ?c print)

)


(defrule calc-outputs-multi
	(goal (phase calc-output))
	(object (is-a Multiplier) (name ?c) (is-calculated no)
		(in1 ?inp-sys1)
		(in2 ?inp-sys2))
	(object (is-a System) (name ?inp-sys1) (value ?inp-val1))
	(object (is-a System) (name ?inp-sys2) (value ?inp-val2))
 =>
	(printout t "f" crlf)
	(modify-instance ?c
		(is-calculated yes)
		(output (send ?c calculate-output-multi ?inp-val1 ?inp-val2))
		(output_msb (send ?c calculate-output-msb-multi ?inp-val1 ?inp-val2)))
;	(send ?c print)
)


(defrule change-goal-to-find-discrepancy
	(not (and (object (is-a Circuit) (is-calculated ?state))(test (eq ?state no))))
	?x <- (goal (phase calc-output))
=>
	(modify ?x (phase find-discrepancy)))


(defrule find-discrepancies
	(goal (phase find-discrepancy))
	(object (is-a Circuit) (name ?c) 
	(output ?out) (out ?s))
	(object (is-a Sensor) (name ?s)
	(value ?sr&~?out))
=>
	(printout t "Sensor " ?s " shows discrepancy: " ?sr " instead of " ?out "!" crlf)
)

(deffunction initialise_circuits ()
	(do-for-all-instances
		((?circuit Ciruit))
		(eq ?circuit:is-calculated yes)
		(modify-instance ?circuit (is-calculated no)) 
	)
)

(defrule test-one
	(declare (salience 1))
	?x <- (goal (phase find-discrepancy) (iteration ?i))
 =>
	(printout t "INSIDE RULE" crlf crlf)
	(modify ?x (phase initialise) (iteration (+ ?i 1)))
	(initialise_circuits))



(defrule stop
	(declare (salience 10))
	?x <- (goal (iteration 11))
 =>
	(retract ?x)
	(halt)
)
