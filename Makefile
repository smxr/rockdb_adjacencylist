CXX = g++

SRCS := $(wildcard *.cpp)
OBJS := $(patsubst %.cpp,%.o,$(SRCS))

LIBS		= -lrocksdb -lpthread -ldl -fopenmp -lboost_program_options
CPPFLAGS	= -g -std=c++14
	
%.o:	%.cpp
	$(CXX) -c $(CPPFLAGS) -o $@ $<	

all:	simple_example se_no_merge

# for macro queries
simple_example:	simple_example.o
	$(CXX) -o ./build/$@ $^ $(LIBS)

se_no_merge:	se_no_merge.o
	$(CXX) -o ./build/$@ $^ $(LIBS) 
	
clean:
	rm -fr ./build/* $(OBJS) 
