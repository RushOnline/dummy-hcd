KERNELRELEASE	?= $(shell uname -r)

KDIR	:= /lib/modules/$(KERNELRELEASE)/build
PWD		:= $(shell pwd)

obj-m	+= dummy_hcd.o

install: modules
	$(MAKE) modules_install

%:
	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) $@

