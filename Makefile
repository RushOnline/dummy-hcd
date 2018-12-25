ifeq ($(KERNELRELEASE),)

KERNELRELEASE	?= $(shell uname -r)
KERNELTAG		?= $(shell uname -r | awk -F. '{ printf "%d.%d", $$1, $$2 }')
KDIR			?= /lib/modules/$(KERNELRELEASE)/build
PWD				:= $(shell pwd)

build:
	$(MAKE) modules

install: modules
	$(MAKE) modules_install

update:
	mv dummy_hcd.c dummy_hcd.c.bak
	wget http://raw.githubusercontent.com/torvalds/linux/v$(KERNELTAG)/drivers/usb/gadget/udc/dummy_hcd.c

dkms:
	sudo dkms install .

%:
	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) $@

.PHONY: build install update dkms

else
obj-m	+= dummy_hcd.o
endif
