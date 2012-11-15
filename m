From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [PATCH 2/3] ARM: tegra: Update default configuration (DRM)
Date: Thu, 15 Nov 2012 22:44:53 +0100
Message-ID: <1353015894-20003-3-git-send-email-thierry.reding@avionic-design.de>
References: <1353015894-20003-1-git-send-email-thierry.reding@avionic-design.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1353015894-20003-1-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Enable the NVIDIA Tegra DRM driver along with CMA to support large
contiguous buffer allocations. While at it, also enable the framebuffer
console that can be used on top of tegra-drm.

Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
---
 arch/arm/configs/tegra_defconfig | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_defconfig
index 4e910ec..e05ac6c 100644
--- a/arch/arm/configs/tegra_defconfig
+++ b/arch/arm/configs/tegra_defconfig
@@ -80,6 +80,7 @@ CONFIG_RFKILL_GPIO=y
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 # CONFIG_FIRMWARE_IN_KERNEL is not set
+CONFIG_CMA=y
 CONFIG_MTD=y
 CONFIG_MTD_CHAR=y
 CONFIG_MTD_M25P80=y
@@ -107,7 +108,6 @@ CONFIG_RT2800USB=m
 CONFIG_INPUT_EVDEV=y
 CONFIG_INPUT_MISC=y
 CONFIG_INPUT_MPU3050=y
-# CONFIG_VT is not set
 # CONFIG_LEGACY_PTYS is not set
 # CONFIG_DEVKMEM is not set
 CONFIG_SERIAL_8250=y
@@ -143,11 +143,15 @@ CONFIG_MEDIA_SUPPORT=y
 CONFIG_MEDIA_CAMERA_SUPPORT=y
 CONFIG_MEDIA_USB_SUPPORT=y
 CONFIG_USB_VIDEO_CLASS=m
+CONFIG_DRM=y
+CONFIG_DRM_TEGRA=y
 CONFIG_BACKLIGHT_LCD_SUPPORT=y
 # CONFIG_LCD_CLASS_DEVICE is not set
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
 # CONFIG_BACKLIGHT_GENERIC is not set
 CONFIG_BACKLIGHT_PWM=y
+CONFIG_FRAMEBUFFER_CONSOLE=y
+CONFIG_LOGO=y
 CONFIG_SOUND=y
 CONFIG_SND=y
 # CONFIG_SND_SUPPORT_OLD_API is not set
-- 
1.8.0
