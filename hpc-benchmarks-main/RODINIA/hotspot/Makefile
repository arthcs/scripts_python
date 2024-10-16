# C compiler
CC =g++ #for reproducibility, change here accordingly
CC_FLAGS = -g -fopenmp -O2

all: hotspot 


hotspot: hotspot_openmp.cpp Makefile 
	$(CC) $(CC_FLAGS) hotspot_openmp.cpp -o hotspot 

clean:
	rm -f hotspot
