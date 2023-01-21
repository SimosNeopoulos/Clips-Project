; 3631 - PANTELEIMON GRAMMATIKOPOULOS
; 3665 - SYMEON NEOPOULOS
; 3590 - ARISTEA LACHANA

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
	(slot Multiplier_1
		(type INTEGER)
		(range 0 32)
		(create-accessor read-write))
	(slot Multiplier_2
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
		(default ?DERIVE))
	(slot is-suspect
		(type SYMBOL)
		(allowed-symbols no yes)
		(default ?DERIVE)))

; Calculates the output of a functional Adder 
(defmessage-handler Adder calculate-output-adder primary (?inp1 ?inp2 )
	(mod (+ ?inp1 ?inp2) 32)
)

; Calculates the output of an Adder missing the most significant bit MSB
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
		(default ?DERIVE))
	(slot is-suspect
		(type SYMBOL)
		(allowed-symbols no yes)
		(default ?DERIVE)))

; Calculates the output of a functional Multiplier 
(defmessage-handler Multiplier calculate-output-multi primary (?inp1 ?inp2 )
	(mod (* ?inp1 ?inp2) 32)
)

; Calculates the output of a Multiplier missing the most significant bit MSB
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
		(create-accessor read-write))
	(slot is-suspect
		(type SYMBOL)
		(allowed-symbols no yes)
		(default ?DERIVE)))

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


; Goals to change the program flow 
; Iteration indicates in which Cycle we are currently in 
(deftemplate goal
	(slot phase
		(type SYMBOL)
		(allowed-symbols initialize calc-output find-discrepancy)
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
	(Multiplier_1 10)
	(Multiplier_2 24)
	(M3 26)
	(number 1)
	(OUT 18))

([Time2] of  Circle

	(input_1 7)
	(input_2 25)
	(input_3 13)
	(input_4 15)
	(Multiplier_1 0)
	(Multiplier_2 0)
	(M3 3)
	(number 2)
	(OUT 3))

([Time3] of  Circle

	(input_1 11)
	(input_2 17)
	(input_3 24)
	(input_4 31)
	(Multiplier_1 22)
	(Multiplier_2 6)
	(M3 8)
	(number 3)
	(OUT 14))

([Time4] of  Circle

	(input_1 18)
	(input_2 11)
	(input_3 28)
	(input_4 21)
	(Multiplier_1 4)
	(Multiplier_2 12)
	(M3 12)
	(number 4)
	(OUT 0))

([Time5] of  Circle

	(input_1 25)
	(input_2 24)
	(input_3 30)
	(input_4 10)
	(Multiplier_1 18)
	(Multiplier_2 16)
	(M3 12)
	(number 5)
	(OUT 12))

([Time6] of  Circle

	(input_1 12)
	(input_2 19)
	(input_3 11)
	(input_4 19)
	(Multiplier_1 8)
	(Multiplier_2 24)
	(M3 17)
	(number 6)
	(OUT 9))

([Time7] of  Circle

	(input_1 1)
	(input_2 31)
	(input_3 7)
	(input_4 22)
	(Multiplier_1 2)
	(Multiplier_2 0)
	(M3 26)
	(number 7)
	(OUT 26))

([Time8] of  Circle

	(input_1 0)
	(input_2 31)
	(input_3 3)
	(input_4 23)
	(Multiplier_1 0)
	(Multiplier_2 0)
	(M3 0)
	(number 8)
	(OUT 0))

([Time9] of  Circle

	(input_1 31)
	(input_2 1)
	(input_3 6)
	(input_4 8)
	(Multiplier_1 30)
	(Multiplier_2 30)
	(M3 0)
	(number 9)
	(OUT 30))

([Time10] of  Circle

	(input_1 6)
	(input_2 4)
	(input_3 25)
	(input_4 12)
	(Multiplier_1 12)
	(Multiplier_2 31)
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

([Multiplier_1] of  Multiplier

	(in1 [input2])
	(in2 [Sensor_1])
	(out [Sensor_2])
	(name_ "Π1"))

([Multiplier_2] of  Multiplier

	(in1 [input3])
	(in2 [input4])
	(out [Sensor_3])
	(name_ "Π2"))

([Sensor_1] of  Sensor

	(name_ "Multiplier_1")
	(value 10)
	(sensor_value_from_adder [Adder_1])
	)

([Sensor_2] of  Sensor

	(name_ "Multiplier_2")
	(value 24)
	(sensor_value_from_multiplier [Multiplier_1])
	)

([Sensor_3] of  Sensor

	(name_ "M3")
	(value 26)
	(sensor_value_from_multiplier [Multiplier_2])
	)

([Adder_1] of  Adder

	(in1 [input1])
	(in2 [input1])
	(out [Sensor_1])
	(name_ "Adder_1"))

([Adder_2] of  Adder

	(in1 [Sensor_3])
	(in2 [Sensor_2])
	(out [OUT])
	(name_ "Adder_2"))

([OUT] of  Output

	(name_ "OUT")
	(value 18)
	(sensor_value_from_adder [Adder_2])
	)
)

; a function to update the values of input instances and sensor instances 
(deffunction update_circle (?input1 ?input2 ?input3 ?input4 ?s1 ?s2 ?s3 ?out)
	(modify-instance [input1]
	(value ?input1))

	(modify-instance [input2]
	(value ?input2))

	(modify-instance [input3]
	(value ?input3))

	(modify-instance [input4]
	(value ?input4))

	;sensors
	(modify-instance [Sensor_1]
	(value ?s1))
	 
	(modify-instance [Sensor_2]
	(value ?s2))

	(modify-instance [Sensor_3]
	(value ?s3))

	;output
	(modify-instance [OUT]
	(value ?out))
)


; the initial rule
(defrule inits
=>
; initialize the goal and the iteration
	(assert (goal (iteration 1) (phase initialize)))
)

; rule to give values to input and sensor instances for each circle
(defrule set_up_values
	?x <- (goal (iteration ?i) (phase initialize))
=>
	(do-for-all-instances
		((?circle Circle))
		(= ?circle:number ?i) 
		;Multiplier_1, Multiplier_2, M3 are the three sensors here 
		(update_circle ?circle:input_1 ?circle:input_2 ?circle:input_3 ?circle:input_4 ?circle:Multiplier_1 ?circle:Multiplier_2 ?circle:M3 ?circle:OUT) 
	)
	(modify ?x  (phase calc-output))
)

; Calculating the outputs of adders
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

; Calculating the outputs of multipliers
(defrule calc-outputs-multi
	(goal (phase calc-output))
	(object (is-a Multiplier) (name ?c) (is-calculated no)
		(in1 ?inp-sys1)
		(in2 ?inp-sys2))
	(object (is-a System) (name ?inp-sys1) (value ?inp-val1))
	(object (is-a System) (name ?inp-sys2) (value ?inp-val2))
 =>
	(modify-instance ?c
		(is-calculated yes)
		(output (send ?c calculate-output-multi ?inp-val1 ?inp-val2))
		(output_msb (send ?c calculate-output-msb-multi ?inp-val1 ?inp-val2)))
;	(send ?c print)
)

; If all the circuits outputs are calculated already, it changes the rule to find descrepancy.
(defrule change-goal-to-find-discrepancy
	(not (and (object (is-a Circuit) (is-calculated ?state))(test (eq ?state no))))
	?x <- (goal (phase calc-output))
=>
	(modify ?x (phase find-discrepancy)))

; Detecting discrepancies and making suspect elements 
(defrule find-discrepancies-msb
	(goal (phase find-discrepancy)(iteration ?i))
	(object (is-a Circuit) (name ?c) 
			(output ?out) (output_msb ?out_msb) (out ?s))
	(object (is-a Sensor) (name ?s)
			(value  ?sr&~?out ))
	(test (eq ?sr ?out_msb))
	
=>
	(printout t "Time: " ?i " --> " ?c "  error: Most Significant Bit is off!" crlf)
	(modify-instance ?c
		(is-suspect yes))
)

; Checking if there is a short circuit by comparing the output of every circuit with its sensor's value
(defrule find-discrepancies-short
	(goal (phase find-discrepancy) (iteration ?i))
	(object (is-a Circuit) (name ?c) (output ?out)
	 		(out ?s))
	(object (is-a Sensor) (name ?s)
			(value  ?sr ))
	(test (and (eq ?sr 0) (neq ?sr ?out)))
	
=>
	(printout t "Time: " ?i "--> " ?c " error: Short-circuit!" crlf)
	(modify-instance ?c (is-suspect yes))
)

; Checking if a sensor has short circuit by testing if the circuit it's getting its output from is a suspect
; If it is not a suspect and the sensor's value is different from the expected circuits output, it means that 
; the sensor is malfunctioning
(defrule find-sensor-discrepancies
	(declare (salience -1))
	(goal (phase find-discrepancy) (iteration ?i))
	(object (is-a Sensor) (name ?s) (value  ?sr))
	(object (is-a Circuit) (out ?s) (output ?out) (is-suspect ?state))
	(test (and (neq ?sr ?out) (neq ?state yes)))
=>
	(printout t "Time: " ?i "--> " ?s " error: Short-circuit!" crlf)
	(modify-instance ?s (is-suspect yes))
)

; If everything works fine and there are no suspects, printout Normal Operation
(defrule everything_is_working
	(declare (salience -2))
	(goal (phase find-discrepancy) (iteration ?i))
	(not (object (is-a System) (is-suspect yes) ))
=>
	(printout t "Time: " ?i "--> Normal Operation!" crlf)
)

; Function that is called to modify the value of is-calculated and is-suspect slots of every circuit 
; from yes to no
(deffunction initialize_circuits ()
	(do-for-all-instances
		((?circuit Circuit))
		(eq ?circuit:is-calculated yes)
		(modify-instance ?circuit (is-calculated no)) 
	)

	(do-for-all-instances
		((?circuit Circuit))
		(eq ?circuit:is-suspect yes)
		(modify-instance ?circuit (is-suspect no)) 
	)
)

; Rule that re-initializes the program flow and increases the iteration by 1
(defrule next_circle
	(declare (salience -3))
	?x <- (goal (phase find-discrepancy) (iteration ?i))
 =>
	(modify ?x (phase initialize) (iteration (+ ?i 1)))
	(initialize_circuits))


; If it's the 11th iteration, the program is halted.
(defrule stop
	(declare (salience 10))
	?x <- (goal (iteration 11))
 =>
	(retract ?x)
	(halt)
)
