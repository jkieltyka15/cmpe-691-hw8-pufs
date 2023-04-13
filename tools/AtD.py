
'''
PUF_out.txt, which contains your analog output matrix, should be in the run directory of this script
'''

with open("./PUF_out.txt",'r') as output_file:
	for line in output_file:
		arr_out = []
		arr = line.split(" ")
		for x in arr:
			if 'E+' in x:
				arr_out.append('1')
			elif 'E-' in x:
				arr_out.append('0')
		print(" ".join(arr_out))
			