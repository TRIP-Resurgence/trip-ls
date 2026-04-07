################################################################################
#
# tripd
#
################################################################################

TRIPD_VERSION = 1.0
TRIPD_SITE = $(call github,TRIP-Resurgence,tripd,98029f5a4ee04ae6b5b8963159f44e0937d0fed4)
TRIPD_INSTALL_TARGET = YES

TRIPD_USERS = tripd 6069 tripd 6069 * - - -
TRIPD_PERMISSIONS = /var/log/tripd.log f 644 6069 6069 - - - - -

$(eval $(cmake-package))

define TRIPD_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 0755 $(@D)/tripd $(TARGET_DIR)/usr/bin
    $(INSTALL) -D -m 0755 $(TRIPD_PKGDIR)/S90tripd $(TARGET_DIR)/etc/init.d
    $(INSTALL) -D -m 0644 $(TRIPD_PKGDIR)/tripd.conf $(TARGET_DIR)/etc
    $(INSTALL) -D -m 0644 $(TRIPD_PKGDIR)/tripd.log $(TARGET_DIR)/var/log
endef

