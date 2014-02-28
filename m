From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 10/10] ARM: tegra: Update default configuration
Date: Fri, 28 Feb 2014 17:40:29 +0100
Message-ID: <1393605629-30514-10-git-send-email-thierry.reding@gmail.com>
References: <1393605629-30514-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393605629-30514-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Enable USB_GSPCA to support the webcam on Venice2. While at it, change
USB_VIDEO_CLASS to =y so that it is built into the kernel image like the
majority of other drivers.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/configs/tegra_defconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_defconfig
index efcf15fb2008..b22b34472cc1 100644
--- a/arch/arm/configs/tegra_defconfig
+++ b/arch/arm/configs/tegra_defconfig
@@ -168,7 +168,8 @@ CONFIG_REGULATOR_TPS65910=y
 CONFIG_MEDIA_SUPPORT=y
 CONFIG_MEDIA_CAMERA_SUPPORT=y
 CONFIG_MEDIA_USB_SUPPORT=y
-CONFIG_USB_VIDEO_CLASS=m
+CONFIG_USB_VIDEO_CLASS=y
+CONFIG_USB_GSPCA=y
 CONFIG_DRM=y
 CONFIG_DRM_TEGRA=y
 CONFIG_DRM_PANEL_SIMPLE=y
-- 
1.8.4.2
