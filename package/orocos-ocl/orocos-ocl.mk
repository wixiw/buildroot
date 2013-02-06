#############################################################
#
# orocos-ocl
#
#############################################################

OROCOS_OCL_DEPENDENCIES = orocos-log4cpp orocos-rtt readline host-pkgconf
OROCOS_OCL_LICENSE = GPLv2


#------------------------------
# Download configuration
#------------------------------

OROCOS_OCL_VERSION = toolchain-2.5
OROCOS_OCL_SITE = git://gitorious.org/orocos-toolchain/ocl.git
OROCOS_OCL_SITE_METHOD = git

#------------------------------
# Build configuration
#------------------------------

# If the user already has an Orocos-toolchain integrated to ROS, CMAKE_INSTALL_PREFIX
# will be forced. To prevent this, we have to unset ROS_ROOT env variable to build.
ifndef ROS_ROOT
	unexport ROS_ROOT
endif

# Orocos customization from Config.in
ifdef BR2_PACKAGE_OROCOS_OCL_DEPLOYMENT
        OROCOS_OCL_CONF_OPT += -DBUILD_DEPLOYMENT=ON
else
	OROCOS_OCL_CONF_OPT += -DBUILD_DEPLOYMENT=OFF
endif

ifdef BR2_PACKAGE_OROCOS_OCL_HELLOWORLD
        OROCOS_OCL_CONF_OPT += -DBUILD_HELLOWORLD=ON
else
	OROCOS_OCL_CONF_OPT += -DBUILD_HELLOWORLD=OFF
endif

ifdef BR2_PACKAGE_OROCOS_OCL_LOGGING
        OROCOS_OCL_CONF_OPT += -DBUILD_LOGGING=ON
else
	OROCOS_OCL_CONF_OPT += -DBUILD_LOGGING=OFF
endif

ifdef BR2_PACKAGE_OROCOS_OCL_LUA
	OROCOS_OCL_CONF_OPT += -DBUILD_LUA_RTT=ON
else
	OROCOS_OCL_CONF_OPT += -DBUILD_LUA_RTT=OFF
endif

ifdef BR2_PACKAGE_OROCOS_OCL_REPORTING
	OROCOS_OCL_CONF_OPT += -DBUILD_REPORTING=ON
else
	OROCOS_OCL_CONF_OPT += -DBUILD_REPORTING=OFF
endif

ifdef BR2_PACKAGE_OROCOS_OCL_TASKBROWSER
	OROCOS_OCL_CONF_OPT += -DBUILD_TASKBROWSER=ON
else
	OROCOS_OCL_CONF_OPT += -DBUILD_TASKBROWSER=OFF
endif

ifdef BR2_PACKAGE_OROCOS_OCL_TIMER
	OROCOS_OCL_CONF_OPT += -DBUILD_TIMER=ON
else
	OROCOS_OCL_CONF_OPT += -DBUILD_TIMER=OFF
endif

ifdef BR2_PACKAGE_OROCOS_OCL_RTALLOC
	OROCOS_OCL_CONF_OPT += -DBUILD_RTALLOC=ON
else
	OROCOS_OCL_CONF_OPT += -DBUILD_RTALLOC=OFF
endif


# Option that should not end in Config.in (there are more related to Buildroot integration than Orocos customization)
OROCOS_OCL_CONF_OPT += -DBUILD_TESTS=OFF
OROCOS_OCL_CONF_OPT += -DCMAKE_BUILD_TYPE=MinSizeRel
OROCOS_OCL_CONF_OPT += -DDOC_BUILD_DOCS=OFF
OROCOS_OCL_CONF_OPT += -DDEFAULT_COMPONENT_PATH=/usr/lib/orocos

#------------------------------
# Installation/Staging configuraiton
#------------------------------

OROCOS_OCL_INSTALL_STAGING = YES
OROCOS_OCL_INSTALL_TARGET = YES


$(eval $(cmake-package))
