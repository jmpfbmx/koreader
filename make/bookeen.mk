BOOKEEN_DIR = $(PLATFORM_DIR)/bookeen
BOOKEEN_PACKAGE = koreader-bookeen$(KODEDUG_SUFFIX)-$(VERSION).zip
BOOKEEN_PACKAGE_OTA = koreader-bookeen$(KODEDUG_SUFFIX)-$(VERSION).targz

#define UPDATE_PATH_EXCLUDES +=
#tools
#endef

update: all
	# ensure that the binaries were built for ARM
	file --dereference $(INSTALL_DIR)/koreader/luajit | grep ARM
	# remove old package if any
	rm -f $(BOOKEEN_PACKAGE)
	# Cervantes launching scripts
	$(SYMLINK) $(COMMON_DIR)/spinning_zsync $(INSTALL_DIR)/koreader/spinning_zsync.sh
	$(SYMLINK) $(BOOKEEN_DIR)/*.sh $(INSTALL_DIR)/koreader
	$(SYMLINK) $(BOOKEEN_DIR)/spinning_zsync $(INSTALL_DIR)/koreader
	# Create packages.
	$(strip $(call mkupdate,$(BOOKEEN_PACKAGE)))
	$(strip $(call mkupdate,$(BOOKEEN_PACKAGE_OTA)))

PHONY += update
