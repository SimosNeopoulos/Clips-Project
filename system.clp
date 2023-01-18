(definstances facts

([KB_737713_Class28] of  %3APAL-CONSTRAINT

	(%3APAL-NAME "example circuit"))

([KB_737713_Class31] of  %3APAL-CONSTRAINT

	(%3APAL-NAME "A1")
	(%3APAL-STATEMENT "(Predicate)"))

([KB_737713_Class32] of  %3APAL-CONSTRAINT

	(%3APAL-NAME "A2"))

([KB_737713_Class33] of  %3APAL-CONSTRAINT

	(%3APAL-NAME "Π1"))

([KB_737713_Class34] of  %3APAL-CONSTRAINT

	(%3APAL-NAME "Π2"))

([KB_737713_Class35] of  %3APAL-CONSTRAINT

	(%3APAL-NAME "M1"))

([KB_737713_Class36] of  %3APAL-CONSTRAINT

	(%3APAL-NAME "M2"))

([KB_737713_Class37] of  %3APAL-CONSTRAINT

	(%3APAL-NAME "M3"))

([KB_737713_Class38] of  %3APAL-CONSTRAINT

	(%3APAL-NAME "In_1"))

([KB_737713_Class39] of  %3APAL-CONSTRAINT

	(%3APAL-NAME "In_2"))

([KB_737713_Class40] of  %3APAL-CONSTRAINT

	(%3APAL-NAME "In_3"))

([KB_737713_Class41] of  %3APAL-CONSTRAINT

	(%3APAL-NAME "In_4"))

([KB_737713_Class43] of  Circle

	(input+1 21)
	(input+2 28)
	(input+3 10)
	(input+4 25)
	(M1 10)
	(M2 24)
	(M3 26)
	(number 1)
	(OUT 18))

([KB_737713_Class44] of  Circle

	(input+1 7)
	(input+2 25)
	(input+3 13)
	(input+4 15)
	(M1 0)
	(M2 0)
	(M3 3)
	(number 2)
	(OUT 3))

([KB_737713_Class45] of  Circle

	(input+1 11)
	(input+2 17)
	(input+3 24)
	(input+4 31)
	(M1 22)
	(M2 6)
	(M3 8)
	(number 3)
	(OUT 14))

([KB_737713_Class46] of  Circle

	(input+1 18)
	(input+2 11)
	(input+3 28)
	(input+4 21)
	(M1 4)
	(M2 12)
	(M3 12)
	(number 4)
	(OUT 0))

([KB_737713_Class47] of  Circle

	(input+1 25)
	(input+2 24)
	(input+3 30)
	(input+4 10)
	(M1 18)
	(M2 16)
	(M3 12)
	(number 5)
	(OUT 12))

([KB_737713_Class48] of  Circle

	(input+1 12)
	(input+2 19)
	(input+3 11)
	(input+4 19)
	(M1 8)
	(M2 24)
	(M3 17)
	(number 6)
	(OUT 9))

([KB_737713_Class49] of  Circle

	(input+1 1)
	(input+2 31)
	(input+3 7)
	(input+4 22)
	(M1 2)
	(M2 0)
	(M3 26)
	(number 7)
	(OUT 26))

([KB_737713_Class50] of  Circle

	(input+1 0)
	(input+2 31)
	(input+3 3)
	(input+4 23)
	(M1 0)
	(M2 0)
	(M3 0)
	(number 8)
	(OUT 0))

([KB_737713_Class51] of  Circle

	(input+1 31)
	(input+2 1)
	(input+3 6)
	(input+4 8)
	(M1 30)
	(M2 30)
	(M3 0)
	(number 9)
	(OUT 30))

([KB_737713_Class52] of  Circle

	(input+1 6)
	(input+2 4)
	(input+3 25)
	(input+4 12)
	(M1 12)
	(M2 31)
	(M3 12)
	(number 10)
	(OUT 28))

([KB_737713_Class56] of  Input

	(name "In_1")
	(value 21))

([KB_737713_Class57] of  Input

	(name "In_2")
	(value 28))

([KB_737713_Class58] of  Input

	(name "In_3")
	(value 10))

([KB_737713_Class59] of  Input

	(name "In_4")
	(value 25))

([KB_737713_Class61] of  Multiplier

	(M_in1 [KB_737713_Class57])
	(M_in2 [KB_737713_Class63])
	(M_out [KB_737713_Class64])
	(name "Π1"))

([KB_737713_Class62] of  Multiplier

	(M_in1 [KB_737713_Class58])
	(M_in2 [KB_737713_Class59])
	(M_out [KB_737713_Class65])
	(name "Π2"))

([KB_737713_Class63] of  Sensor

	(name "M1")
	(sensor_value_adder [KB_737713_Class70]))

([KB_737713_Class64] of  Sensor

	(name "M2")
	(sensor_value_multiplier [KB_737713_Class61]))

([KB_737713_Class65] of  Sensor

	(name "M3")
	(sensor_value_multiplier [KB_737713_Class62]))

([KB_737713_Class70] of  Adder

	(A_in1 [KB_737713_Class56])
	(A_in2 [KB_737713_Class56])
	(A_out [KB_737713_Class63])
	(name "A1"))

([KB_737713_Class71] of  Adder

	(A_in1 [KB_737713_Class65])
	(A_in2 [KB_737713_Class64])
	(A_out [KB_737713_Class73])
	(name "A2"))

([KB_737713_Class73] of  Output

	(name "OUT")
	(sensor_value_adder [KB_737713_Class71]))
)
