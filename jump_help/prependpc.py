import sys

if(len(sys.argv) != 3):
	print("USAGE: python3 prependpc inpath outpath")
else:
    infile_path = sys.argv[1]
    outfile_path = sys.argv[2] 

    outfile = open(outfile_path,"w+")
    with open(infile_path,"r") as infile:
        content = infile.readlines()
        outfile.write("LEGEND: \n (REGISTER) = x\" VALUE \", \n @{_func} ... function call, {_func} ... function execution \n\n")
        outfile.write("[PC*4]  actualpc :  instr  ; assembly                | description\n")
        for line in content:
            pc_str = line[:8]
            pc = int(pc_str,16)
            pc = pc * 4
            outfile.write("["+'{0:04X}'.format(pc)+"]  " + line)
    
    outfile.close()