From: Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] dts: tegra-ventana: use proper root instead of /dev/ram
Date: Mon, 14 Nov 2011 11:40:32 +0530
Message-ID: <1321251032-5461-1-git-send-email-vwadekar@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

the root file system on ventana resides on /dev/mmcblk0p1.
update the dts file to use the proper root instead of /dev/ram.

Original-author: Pritesh Raithatha <praithatha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra-ventana.dts |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/boot/dts/tegra-ventana.dts b/arch/arm/boot/dts/tegra-ventana.dts
index 9b29a62..5f7fe74 100644
--- a/arch/arm/boot/dts/tegra-ventana.dts
+++ b/arch/arm/boot/dts/tegra-ventana.dts
@@ -8,7 +8,7 @@
 	compatible = "nvidia,ventana", "nvidia,tegra20";
 
 	chosen {
-		bootargs = "vmalloc=192M video=tegrafb console=ttyS0,115200n8 root=/dev/ram rdinit=/sbin/init";
+		bootargs = "vmalloc=192M video=tegrafb console=ttyS0,115200n8 root=/dev/mmcblk0p1 rw rootwait";
 	};
 
 	memory {
-- 
1.7.1
