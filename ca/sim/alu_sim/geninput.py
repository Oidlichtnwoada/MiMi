import math

with open('input.csv', 'r') as input:
	with open('output_expected.csv', 'w') as output:

		output.write('R,Z,V\n')
		
		for r in input:
			if r == "op,A,B\n":
				continue
			i = r.split(',')
			op = i[0].rstrip("\n")
			A = int(i[1].rstrip("\n"),2)
			B = int(i[2].rstrip("\n"),2)
			R = 0
			V = 0
			Z = 0
			
			
			if op == "ALU_NOP":
				R = A
			elif op == "ALU_LUI":
				R = B << 16
			elif op == "ALU_SLT":
				if A < B":
					R = 1
				else
					R = 0
			elif op == "ALU_SLTU":
				if A < B":
					R = 1
				else
					R = 0
			elif op == "ALU_SLL":
			
			elif op == "ALU_SRL":
			
			elif op == "ALU_SRA":
			
			elif op == "ALU_ADD":
			
			elif op == "ALU_SUB":
			
			elif op == "ALU_AND":
			
			elif op == "ALU_OR":
			
			elif op == "ALU_XOR":
			
			elif op == "ALU_NOR":
			
			
			Rout = "{0:032b}".format(R)
			Rout = Rout.slice(-32,None)
			print(Rout)
			
			print(op+",{0:04b},{1:04b}".format(A,B))
	
	output.close()
input.close()