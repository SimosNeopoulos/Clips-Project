; Mon Dec 12 20:18:03 EET 2022
; 
;+ (version "3.5")
;+ (build "Build 663")



(defclass Circle
	(is-a USER)
	(role concrete)
	(single-slot M3
		(type INTEGER)
		(range 0 32)
		(create-accessor read-write))
	(single-slot input+1
		(type INTEGER)
		(range 0 32)
		(create-accessor read-write))
	(single-slot input+2
		(type INTEGER)
		(range 0 32)
		(create-accessor read-write))
	(single-slot input+3
		(type INTEGER)
		(range 0 32)
		(create-accessor read-write))
	(single-slot OUT
		(type INTEGER)
		(range 0 32)
		(create-accessor read-write))
	(single-slot number
		(type INTEGER)
		(create-accessor read-write))
	(single-slot input+4
		(type INTEGER)
		(range 0 32)
		(create-accessor read-write))
	(single-slot M1
		(type INTEGER)
		(range 0 32)
		(create-accessor read-write))
	(single-slot M2
		(type INTEGER)
		(range 0 32)
		(create-accessor read-write)))

(defclass System
	(is-a USER)
	(role concrete)
	(single-slot name_
		(type STRING)
		(create-accessor read-write)))

(defclass Circuit
	(is-a System)
	(role concrete))

(defclass Adder
	(is-a Circuit)
	(role concrete)
	(single-slot A_in1
		(type INSTANCE)
		(create-accessor read-write))
	(single-slot A_in2
		(type INSTANCE)
		(create-accessor read-write))
	(single-slot A_out
		(type INSTANCE)
		(create-accessor read-write)))

(defclass Multiplier
	(is-a Circuit)
	(role concrete)
	(single-slot M_in2
		(type INSTANCE)
		(create-accessor read-write))
	(single-slot M_in1
		(type INSTANCE)
		(create-accessor read-write))
	(single-slot M_out
		(type INSTANCE)
		(create-accessor read-write)))

(defclass Sensor
	(is-a System)
	(role concrete)
	(single-slot sensor_value_multiplier
		(type INSTANCE)
		(create-accessor read-write))
	(single-slot sensor_value_adder
		(type INSTANCE)
		(create-accessor read-write)))

(defclass Output
	(is-a Sensor)
	(role concrete))

(defclass Input
	(is-a System)
	(role concrete)
	(single-slot value
		(type INTEGER)
		(range 0 32)
		(create-accessor read-write)))