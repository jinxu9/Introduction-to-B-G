# still learning how to use shell scripts
# use python for now to save time 

with open('C_elegans.fa.fai') as cfa:
	lines = cfa.readlines()

size = 0
chrom_size = len(lines)
for line in lines:
	line = line.split()
	size +=int(line[1])

name  	  = "name:\tC.elegans genome\n"
version   = "version:\tWBcel234/cell\n"
fin_time  = "finish time:\tFeb.2013\n"
size_out  = "size:\t"+str(size)+"\n"
chrom_out = "Number of chromosomes:\t"+str(chrom_size) 

with open('C_elegans_information.txt','w') as out:
	out.write(name+version+fin_time+size_out+chrom_out)
	

