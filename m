From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [flasher PATCH] readme: document dependencies
Date: Thu,  1 Aug 2013 14:11:04 -0600
Message-ID: <1375387864-23198-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

In README-developer.txt, document some of the distro packages required to
build the tools and flash images. Point out issues with libusb versions.

Enhance README-user.txt to mention that the steps in README-developer.txt
typically need to be followed first, and briefly describe what's contained
in the flash images this tool handles.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 README-developer.txt | 22 ++++++++++++++++++++++
 README-user.txt      | 23 ++++++++++++++++++++++-
 2 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/README-developer.txt b/README-developer.txt
index d59ec07..9feff24 100644
--- a/README-developer.txt
+++ b/README-developer.txt
@@ -55,6 +55,28 @@ to specify which you want. Valid values are default.xml (all required
 dependencies) and default-notools.xml (excludes the source to potentially
 distro-packaged utilities cbootimage, tegrarcm, dtc).
 
+Pre-requisites
+==============
+
+A number of common tools and libraries required to build tegra-uboot-flasher.
+Typically, these will be provided by standard distribution packages.
+
+For recent Debian-/Ubuntu-based distributions, the following list of packages
+will be useful:
+
+  build-essential
+  autoconf
+  automake
+  libusb-1.0-0-dev
+  libcrypto++-dev
+
+Packages with similar names likely exist for other distributions too.
+
+Note: tegrarcm depends on libusb-1.0. On at least current Debian-/Ubuntu-based
+distributions, the default/unversioned libusb package installed contains
+libusb-0.1. Make sure that libusb-1.0 is installed by using the explicit
+versioned package name specified above.
+
 Compiling Potentially Packaged Utilities
 ========================================
 
diff --git a/README-user.txt b/README-user.txt
index b653144..0071497 100644
--- a/README-user.txt
+++ b/README-user.txt
@@ -5,6 +5,27 @@ This project provides scripts and data that provide a simple way of using
 tegrarcm and U-Boot to write U-Boot (or an alternative image) to the boot
 flash of a Tegra device.
 
+The flash images handled by this tool include just the bootloader and any
+other data necessary for the bootloader to execute (i.e. the BCT). Creating or
+flashing a root filesystem, either on the Tegra device's built-in flash, or on
+external storage media, is a separate step unrelated to this tool.
+
+Pre-requisites
+==============
+
+This document assumes that the instructions in README-developer.txt have
+already been followed. Those instructions generate various files that the
+flashing process uses. These include host-based utilities such as tegrarcm,
+U-Boot binaries that run on the Tegra target device, and the flash images to
+write to the Tegra device. 
+
+If you are using a distribution package of this tool, the development steps
+have likely already been followed, and you need only follow the instructions
+in this file.
+
+If you are working with the source code to this tool, you almost certainly
+need to follow the instructions in README-developer.txt first.
+
 Board Configurations
 ====================
 
@@ -14,7 +35,7 @@ Each board may exist in a number of different configurations; perhaps the
 RAM size or speed varies, or a different type of boot flash is supported.
 Each of these configurations is also given a name. tegra-uboot-flasher's
 user-interface uses these configuration names exclusively. Examples are
-harmony, cardhu-a02-1gb.config, cardhu-a04-1gb.config.
+harmony, cardhu-a02-1gb, cardhu-a04-1gb.
 
 You may find a list of valid values for configname by executing:
 
-- 
1.8.1.5
