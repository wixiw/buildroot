#############################################################
#
# orocos-rtt
#
#############################################################

#Boost modules dependencies : filesystem, system, serialisation, graph, program option
OROCOS_RTT_DEPENDENCIES = boost
OROCOS_RTT_LICENSE = GPLv2


#------------------------------
# Download configuration
#------------------------------

OROCOS_RTT_VERSION = toolchain-2.5
OROCOS_RTT_SITE = git://gitorious.org/orocos-toolchain/rtt.git
OROCOS_RTT_SITE_METHOD = git



#------------------------------
# Build configuration
#------------------------------

# If the user already has an Orocos-toolchain integrated to ROS, CMAKE_INSTALL_PREFIX
# will be forced. To prevent this, we have to unset ROS_ROOT env variable to build.
ifndef ROS_ROOT
	unexport ROS_ROOT
endif

# Orocos customization from Config.in
ifdef BR2_PACKAGE_OROCOS_RTT_OS_EMBEDDED_SCRIPTING
        OROCOS_RTT_CONF_OPT += -DOS_EMBEDDED_SCRIPTING=ON
else
	OROCOS_RTT_CONF_OPT += -DOS_EMBEDDED_SCRIPTING=OFF
endif

ifdef BR2_PACKAGE_OROCOS_RTT_ENABLE_CORBA
        OROCOS_RTT_CONF_OPT += -DENABLE_CORBA=ON 
else
	OROCOS_RTT_CONF_OPT += -DENABLE_CORBA=OFF 
endif

ifdef BR2_PACKAGE_OROCOS_RTT_ENABLE_MQ
        OROCOS_RTT_CONF_OPT += -DENABLE_MQ=ON
else
	OROCOS_RTT_CONF_OPT += DENABLE_MQ=OFF
endif

ifdef BR2_PACKAGE_OROCOS_RTT_ACT_DEFAULT_ACTIVITY
        OROCOS_RTT_CONF_OPT += -DORO_ACT_DEFAULT_ACTIVITY=ON
else
	OROCOS_RTT_CONF_OPT += -DORO_ACT_DEFAULT_ACTIVITY=OFF
endif

ifdef BR2_PACKAGE_OROCOS_RTT_PLUGINS_ENABLE
        OROCOS_RTT_CONF_OPT += -DPLUGINS_ENABLE=ON
else
	OROCOS_RTT_CONF_OPT += -DPLUGINS_ENABLE=OFF
endif

ifdef BR2_PACKAGE_OROCOS_RTT_PLUGINS_ENABLE_TYPEKIT
        OROCOS_RTT_CONF_OPT += -DPLUGINS_ENABLE_TYPEKIT=ON
else
	OROCOS_RTT_CONF_OPT += -DPLUGINS_ENABLE_TYPEKIT=OFF
endif

# Option that should not end in Config.in (there are more related to Buildroot integration than Orocos customization)
OROCOS_RTT_CONF_OPT += -DOS_RT_MALLOC=ON
OROCOS_RTT_CONF_OPT += -DOS_RT_MALLOC_MMAP=OFF 
OROCOS_RTT_CONF_OPT += -DOS_RT_MALLOC_SBRK=OFF 
OROCOS_RTT_CONF_OPT += -DBUILD_DOCS=OFF 
OROCOS_RTT_CONF_OPT += -DENABLE_TESTS=OFF 
OROCOS_RTT_CONF_OPT += -DCMAKE_BUILD_TYPE=MinSizeRel 
OROCOS_RTT_CONF_OPT += -DOS_RT_MALLOC_STATS=OFF
OROCOS_RTT_CONF_OPT += -DORO_REMOTING=OFF

#------------------------------
# Installation/staging configuraiton
#------------------------------

#definition du repertoire pour le staging
OROCOS_RTT_CONF_OPT += -DCMAKE_INSTALL_PREFIX=/usr

OROCOS_RTT_INSTALL_STAGING = YES
OROCOS_RTT_INSTALL_TARGET = YES

$(eval $(cmake-package))
