#
# This file should set PRODUCT_MAKEFILES to a list of product makefiles
# to expose to the build system.  LOCAL_DIR will already be set to
# the directory containing this file.
# PRODUCT_MAKEFILES is set up in AndroidProducts.mks.
# Format of PRODUCT_MAKEFILES:
# <product_name>:<path_to_the_product_makefile>
# If the <product_name> is the same as the base file name (without dir
# and the .mk suffix) of the product makefile, "<product_name>:" can be
# omitted.
#
# This file may not rely on the value of any variable other than
# LOCAL_DIR; do not use any conditionals, and do not look up the
# value of any variable that isn't set in this file or in a file that
# it includes.
#

PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/reopen_mini6410.mk
