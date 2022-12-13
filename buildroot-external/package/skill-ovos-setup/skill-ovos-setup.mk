################################################################################
#
# skill-ovos-setup
#
################################################################################

SKILL_OVOS_SETUP_VERSION = 5de17eef52762c7b9cf750fa155fe281d29f9210
SKILL_OVOS_SETUP_SITE = $(call github,OpenVoiceOS,skill-ovos-setup,$(SKILL_OVOS_SETUP_VERSION))
SKILL_OVOS_SETUP_SETUP_TYPE = setuptools
SKILL_OVOS_SETUP_LICENSE_FILES = LICENSE
SKILL_OVOS_SETUP_ENV = MYCROFT_LOOSE_REQUIREMENTS=true

$(eval $(python-package))
