PREFIX ?= /usr/local

INSTALL ?= install
SED ?= sed

.PHONY: install all clean

all: built_python

install: all
	python setup.py install

LIBS = $(shell pkg-config ladspamm-0 --libs --cflags)


built_python: ladspamm0.i
	swig `pkg-config ladspamm-0 --cflags` -python -c++ -o ladspamm_wrap.cc ladspamm0.i
	python setup.py build_ext -l"dl boost_system boost_filesystem"
	touch built_python

clean:
	rm -f ladspamm_wrap.cc ladspamm0.py built_python 
	rm -rf build

	
