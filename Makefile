include $(TOPDIR)/rules.mk

PKG_NAME:=vlmcsd
PKG_VERSION:=svn1112
PKG_RELEASE:=1

PKG_MAINTAINER:=HotBird64
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://bitbucket.org/gocloudplus/vlmcsd.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=6d4b4fef4d13332005da8ca37c25ebbe772067d9
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Package/vlmcsd
	SECTION:=net
	CATEGORY:=Network
	TITLE:=vlmcsd for OpenWRT
	URL:=http://forums.mydigitallife.info/threads/50234
	DEPENDS:=+libpthread
endef

define Package/vlmcsd/description
	vlmcsd is a KMS Emulator in C.
endef

MAKE_FLAGS += \
	-C $(PKG_BUILD_DIR)

define Package/vlmcsd/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bin/vlmcsd $(1)/usr/bin/vlmcsd
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bin/vlmcs $(1)/usr/bin/vlmcs
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/etc/vlmcsd.ini $(1)/etc/vlmcsd.ini
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/vlmcsd.init $(1)/etc/init.d/vlmcsd
endef

$(eval $(call BuildPackage,vlmcsd))
