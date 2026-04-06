################################################################################
#
# tripd
#
################################################################################

TRIPD_VERSION = 1.0
TRIPD_SITE = $(call github,TRIP-Resurgence,tripd,34a9d36e31409e8b4876c2464c44982f878a31f8)
TRIPD_INSTALL_TARGET = YES

$(eval $(cmake-package))

