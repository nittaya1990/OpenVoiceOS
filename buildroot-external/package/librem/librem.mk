#############################################################
#
# librem
#
#############################################################

LIBREM_VERSION = 1.0.0
LIBREM_SOURCE = v$(LIBREM_VERSION).tar.gz
LIBREM_SITE = https://github.com/baresip/rem/archive
LIBREM_INSTALL_STAGING = YES

ifeq ($(BR2_PACKAGE_LIBRE),y)
LIBREM_DEPENDENCIES += libre
endif

define LIBREM_BUILD_CMDS
	$(TARGET_MAKE_ENV) \
		$(MAKE) -C $(@D) \
			LIBRE_MK=$(STAGING_DIR)/usr/share/re/re.mk \
			LIBRE_INC=$(STAGING_DIR)/usr/include/re \
			LIBRE_SO=$(STAGING_DIR)/usr/lib \
			HAVE_LIBRESOLV= \
			CC="$(TARGET_CC)" \
			EXTRA_CFLAGS="$(TARGET_CFLAGS)" \
			EXTRA_LFLAGS="-lm" \
			DESTDIR="$(STAGING_DIR)" \
			SYSROOT="$(STAGING_DIR)/usr" \
			SYSROOT_ALT="$(STAGING_DIR)/usr" \
			RELEASE=1 \
			CROSS_COMPILE="$(TARGET_CROSS)" \
			OS=linux \
			all install
endef

define LIBREM_INSTALL_TARGET_CMDS
        $(INSTALL) -m 644 -D $(@D)/librem.so $(TARGET_DIR)/usr/lib/librem.so
endef

$(eval $(generic-package))
