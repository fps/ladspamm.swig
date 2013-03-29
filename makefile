PREFIX ?= /usr/local

INSTALL ?= install
SED ?= sed

INCLUDE_PATH = $(PREFIX)/include/ladspamm-0
PKGCONFIG_DIR ?= $(PREFIX)/lib/pkgconfig

.PHONY: install all clean

all: built_python

install: all
	python setup.py install


built_python: ladspamm0.i
	swig -I/usr/local/include -python -c++ -o ladspamm_wrap.cc ladspamm0.i
	python setup.py build_ext -ldl -lboost_system -lboost_filesystem -I ./ladspamm
	touch built_python

clean:
	rm -f ladspamm_wrap.cc ladspamm0.py built_python 
	rm -rf build

	
