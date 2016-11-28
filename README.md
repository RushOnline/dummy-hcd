# dummy-hcd
Make and DKMS support for dummy/Loopback USB host and device emulator driver.


~~~bash
# Install
git clone https://github.com/RushOnline/dummy-hcd.git
# Optional replace provided dummy_hcd.c with your own
ln -snf $PATH_TO_LINUX_KERNEL_SOURCE/drivers/usb/gadget/udc/dummy_hcd.c dummy-hcd/
sudo dkms install dummy-hcd
# Remove
# sudo dkms remove dummy-hcd/0.1 --all
~~~
