From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/2] ARM: tegra: Remove eMMC vmmc property for roth/tn7
Date: Thu, 13 Nov 2014 13:59:02 +0900
Message-ID: <1415854743-11670-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This property was wrong and broke eMMC since commit 52221610d. Align the
eMMC properties to those of other Tegra boards.

Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Stephen, Thierry, could we merge these two guys for 3.18? Roth and TN7
are effectively broken until these fixes are in. Thanks!

 arch/arm/boot/dts/tegra114-roth.dts | 1 -
 arch/arm/boot/dts/tegra114-tn7.dts  | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra114-roth.dts b/arch/arm/boot/dts/tegra114-roth.dts
index c7c6825f11fb..1f6eaba92f67 100644
--- a/arch/arm/boot/dts/tegra114-roth.dts
+++ b/arch/arm/boot/dts/tegra114-roth.dts
@@ -971,7 +971,6 @@
 	sdhci@78000600 {
 		status = "okay";
 		bus-width = <8>;
-		vmmc-supply = <&vdd_1v8>;
 		non-removable;
 	};
 
diff --git a/arch/arm/boot/dts/tegra114-tn7.dts b/arch/arm/boot/dts/tegra114-tn7.dts
index 963662145635..3c3e2afc537d 100644
--- a/arch/arm/boot/dts/tegra114-tn7.dts
+++ b/arch/arm/boot/dts/tegra114-tn7.dts
@@ -240,7 +240,6 @@
 	sdhci@78000600 {
 		status = "okay";
 		bus-width = <8>;
-		vmmc-supply = <&vdd_1v8>;
 		non-removable;
 	};
 
-- 
2.1.3
