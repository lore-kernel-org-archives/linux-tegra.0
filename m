From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH] ARM: tegra: update defconfig to support more paz00 hardware
Date: Sat, 18 Aug 2012 19:10:41 +0200
Message-ID: <2895bbda75127f208239e07dbbcf79e718cf684f.1345309601.git.marvin24@gmx.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This update adds various devices found on the usb bus on PAZ00 boards:

	- Wifi chip (rt3070)
	- Bluetooth (btusb)
	- Camera (uvcvideo)
	- 3G modem (acm and wdm)

These are enabled as modules because they are not needed for boot and
will not be used on other boards. Wifi also needs to be module because
of the firmware loader.

The update also enabled support for the rfkill switch, the Wifi LED and
the nvec power and led driver which got lost in the past.

Finally, devtmpfs and tmpfs acls are enabled because they are mandatory
on modern linux distros.

Signed-off-by: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
---
 arch/arm/configs/tegra_defconfig |   33 +++++++++++++++++++++++++++++----
 1 file changed, 29 insertions(+), 4 deletions(-)

diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_defconfig
index c7f7c7f..ef2c679 100644
--- a/arch/arm/configs/tegra_defconfig
+++ b/arch/arm/configs/tegra_defconfig
@@ -68,7 +68,18 @@ CONFIG_INET6_IPCOMP=y
 CONFIG_IPV6_MIP6=y
 CONFIG_IPV6_TUNNEL=y
 CONFIG_IPV6_MULTIPLE_TABLES=y
-# CONFIG_WIRELESS is not set
+CONFIG_BT=y
+CONFIG_BT_RFCOMM=y
+CONFIG_BT_BNEP=y
+CONFIG_BT_HIDP=y
+CONFIG_BT_HCIBTUSB=m
+CONFIG_CFG80211=y
+CONFIG_MAC80211=y
+CONFIG_RFKILL=y
+CONFIG_RFKILL_INPUT=y
+CONFIG_RFKILL_GPIO=y
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
 # CONFIG_FIRMWARE_IN_KERNEL is not set
 CONFIG_PROC_DEVICETREE=y
 CONFIG_BLK_DEV_LOOP=y
@@ -88,7 +99,8 @@ CONFIG_USB_PEGASUS=y
 CONFIG_USB_USBNET=y
 CONFIG_USB_NET_SMSC75XX=y
 CONFIG_USB_NET_SMSC95XX=y
-# CONFIG_WLAN is not set
+CONFIG_RT2X00=y
+CONFIG_RT2800USB=m
 CONFIG_INPUT_EVDEV=y
 CONFIG_INPUT_MISC=y
 CONFIG_INPUT_MPU3050=y
@@ -123,6 +135,11 @@ CONFIG_REGULATOR_MAX8907=y
 CONFIG_REGULATOR_TPS62360=y
 CONFIG_REGULATOR_TPS6586X=y
 CONFIG_REGULATOR_TPS65910=y
+CONFIG_MEDIA_SUPPORT=y
+CONFIG_MEDIA_CAMERA_SUPPORT=y
+CONFIG_USB_VIDEO_CLASS=m
+# CONFIG_USB_VIDEO_CLASS_INPUT_EVDEV is not set
+# CONFIG_USB_GSPCA is not set
 CONFIG_SOUND=y
 CONFIG_SND=y
 # CONFIG_SND_SUPPORT_OLD_API is not set
@@ -139,12 +156,19 @@ CONFIG_SND_SOC_TEGRA_ALC5632=y
 CONFIG_USB=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_EHCI_TEGRA=y
+CONFIG_USB_ACM=y
+CONFIG_USB_WDM=y
 CONFIG_USB_STORAGE=y
 CONFIG_MMC=y
 CONFIG_MMC_BLOCK_MINORS=16
 CONFIG_MMC_SDHCI=y
 CONFIG_MMC_SDHCI_PLTFM=y
 CONFIG_MMC_SDHCI_TEGRA=y
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_GPIO=y
+CONFIG_LEDS_TRIGGERS=y
+CONFIG_LEDS_TRIGGER_GPIO=y
 CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_MAX8907=y
 CONFIG_RTC_DRV_EM3027=y
@@ -156,6 +180,8 @@ CONFIG_SENSORS_AK8975=y
 CONFIG_MFD_NVEC=y
 CONFIG_KEYBOARD_NVEC=y
 CONFIG_SERIO_NVEC_PS2=y
+CONFIG_NVEC_POWER=y
+CONFIG_NVEC_PAZ00=y
 CONFIG_TEGRA_IOMMU_GART=y
 CONFIG_TEGRA_IOMMU_SMMU=y
 CONFIG_MEMORY=y
@@ -174,6 +200,7 @@ CONFIG_EXT4_FS=y
 # CONFIG_DNOTIFY is not set
 CONFIG_VFAT_FS=y
 CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
 CONFIG_NFS_FS=y
 CONFIG_ROOT_NFS=y
 CONFIG_NLS_CODEPAGE_437=y
@@ -192,8 +219,6 @@ CONFIG_DEBUG_VM=y
 CONFIG_DEBUG_SG=y
 CONFIG_DEBUG_LL=y
 CONFIG_EARLY_PRINTK=y
-CONFIG_CRYPTO_ECB=y
-CONFIG_CRYPTO_ARC4=y
 CONFIG_CRYPTO_TWOFISH=y
 # CONFIG_CRYPTO_ANSI_CPRNG is not set
 CONFIG_CRYPTO_DEV_TEGRA_AES=y
-- 
1.7.9.5
