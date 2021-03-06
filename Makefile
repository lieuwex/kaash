CXXFLAGS_BASE = -Wall -std=c++11 -lreadline
ifdef DEBUG
	CXXFLAGS = $(CXXFLAGS_BASE) -g
else
	CXXFLAGS = $(CXXFLAGS_BASE) -O2
endif
CXX = g++

BINARIES = kaash
CXX_FILES = $(shell echo *.cpp)
H_FILES = *.h
OBJ_FILES = $(CXX_FILES:.cpp=.o)

.PHONY: all clean remake

all: $(BINARIES)

clean:
	rm -f $(BINARIES) $(OBJ_FILES)

remake: clean all

kaash: $(OBJ_FILES)
	$(CXX) $(CXXFLAGS) -o $@ $(OBJ_FILES)
ifndef DEBUG
	strip $@
endif

%.o: %.cpp %.h
	$(CXX) $(CXXFLAGS) -c -o $*.o $*.cpp
