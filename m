From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] ARM: tegra: trimslice: enable SPI flash
Date: Tue, 13 Nov 2012 12:23:53 -0700
Message-ID: <1352834633-1426-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

TrimSlice contains a 1MiB SPI flash. Represent this in the device tree.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra20-trimslice.dts |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-trimslice.dts b/arch/arm/boot/dts/tegra20-trimslice.dts
index 27fb8a6..f4e0428 100644
--- a/arch/arm/boot/dts/tegra20-trimslice.dts
+++ b/arch/arm/boot/dts/tegra20-trimslice.dts
@@ -254,6 +254,16 @@
 		clock-frequency = <400000>;
 	};
 
+	spi@7000c380 {
+		status = "okay";
+		spi-max-frequency = <48000000>;
+		spi-flash@0 {
+			compatible = "winbond,w25q80bl";
+			reg = <0>;
+			spi-max-frequency = <48000000>;
+		};
+	};
+
 	i2c@7000c400 {
 		status = "okay";
 		clock-frequency = <400000>;
-- 
1.7.0.4
