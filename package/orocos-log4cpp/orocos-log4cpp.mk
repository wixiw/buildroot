#############################################################
#
# orocos-log4cpp
#
#############################################################

OROCOS_LOG4CPP_LICENSE = LGPLv2.1+

#------------------------------
# Download configuration
#------------------------------

OROCOS_LOG4CPP_VERSION = toolchain-2.5
OROCOS_LOG4CPP_SITE = git://gitorious.org/orocos-toolchain/log4cpp.git
OROCOS_LOG4CPP_SITE_METHOD = git

#------------------------------
# Installation/Staging configuration
#------------------------------

OROCOS_LOG4CPP_INSTALL_STAGING = YES
OROCOS_LOG4CPP_INSTALL_TARGET = YES


$(eval $(cmake-package))

