PVMINC=$(PVM_ROOT)/include
PVMLIB=$(PVM_ROOT)/lib/$(PVM_ARCH)

all:	$(PVM_HOME)/master $(PVM_HOME)/ship

run:
	$(PVM_HOME)/master

$(PVM_HOME)/master:	master.c def.h
	$(CC) -g master.c -o $(PVM_HOME)/master -L$(PVMLIB) -I$(PVMINC) -lpvm3 -lgpvm3

$(PVM_HOME)/ship:	ship.c def.h utils.h clk.o que.o
	$(CC) -g ship.c clk.o que.o -o $(PVM_HOME)/ship -L$(PVMLIB) -I$(PVMINC) -lpvm3 -lgpvm3 -lm

$clk.o:	clk.c clk.h
	$(CC) -g -c clk.c -L$(PVMLIB) -I$(PVMINC) -lpvm3 -lgpvm3

$que.o:	que.c que.h
	$(CC) -g -c que.c

clean:
	rm $(PVM_HOME)/master $(PVM_HOME)/ship
	rm -f *.o
