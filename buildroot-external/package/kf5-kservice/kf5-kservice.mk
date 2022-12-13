################################################################################
#
# kf5-kservice
#
################################################################################

KF5_KSERVICE_VERSION = $(KF5_VERSION)
KF5_KSERVICE_SITE = $(KF5_SITE)
KF5_KSERVICE_SOURCE = kservice-$(KF5_KSERVICE_VERSION).tar.xz
KF5_KSERVICE_LICENSE = BSD-3-Clause
KF5_KSERVICE_LICENSE_FILES = COPYING-CMAKE-SCRIPTS

KF5_KSERVICE_DEPENDENCIES = host-pkgconf
KF5_KSERVICE_INSTALL_STAGING = YES
KF5_KSERVICE_SUPPORTS_IN_SOURCE_BUILD = NO

KF5_KSERVICE_POST_INSTALL_STAGING_HOOKS = KF5_KSERVICE_DESKTOPTOJSON

define KF5_KSERVICE_DESKTOPTOJSON
        cp /usr/bin/desktoptojson $(STAGING_DIR)/usr/bin/
endef

$(eval $(cmake-package))
