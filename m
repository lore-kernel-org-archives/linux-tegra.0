From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] ARM: tegra: Use "disabled" for status property
Date: Tue, 25 Feb 2014 16:31:40 +0100
Message-ID: <1393342300-9477-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

To disable a device tree node, the status property should be set to
"disabled", not "disable".

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra114.dtsi | 8 ++++----
 arch/arm/boot/dts/tegra124.dtsi | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi
index 44ec401ec366..fdc559ab2db3 100644
--- a/arch/arm/boot/dts/tegra114.dtsi
+++ b/arch/arm/boot/dts/tegra114.dtsi
@@ -604,7 +604,7 @@
 		clocks = <&tegra_car TEGRA114_CLK_SDMMC1>;
 		resets = <&tegra_car 14>;
 		reset-names = "sdhci";
-		status = "disable";
+		status = "disabled";
 	};
 
 	sdhci@78000200 {
@@ -614,7 +614,7 @@
 		clocks = <&tegra_car TEGRA114_CLK_SDMMC2>;
 		resets = <&tegra_car 9>;
 		reset-names = "sdhci";
-		status = "disable";
+		status = "disabled";
 	};
 
 	sdhci@78000400 {
@@ -624,7 +624,7 @@
 		clocks = <&tegra_car TEGRA114_CLK_SDMMC3>;
 		resets = <&tegra_car 69>;
 		reset-names = "sdhci";
-		status = "disable";
+		status = "disabled";
 	};
 
 	sdhci@78000600 {
@@ -634,7 +634,7 @@
 		clocks = <&tegra_car TEGRA114_CLK_SDMMC4>;
 		resets = <&tegra_car 15>;
 		reset-names = "sdhci";
-		status = "disable";
+		status = "disabled";
 	};
 
 	usb@7d000000 {
diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
index ec0698a8354a..30a7377d5600 100644
--- a/arch/arm/boot/dts/tegra124.dtsi
+++ b/arch/arm/boot/dts/tegra124.dtsi
@@ -388,7 +388,7 @@
 		clocks = <&tegra_car TEGRA124_CLK_SDMMC1>;
 		resets = <&tegra_car 14>;
 		reset-names = "sdhci";
-		status = "disable";
+		status = "disabled";
 	};
 
 	sdhci@700b0200 {
@@ -398,7 +398,7 @@
 		clocks = <&tegra_car TEGRA124_CLK_SDMMC2>;
 		resets = <&tegra_car 9>;
 		reset-names = "sdhci";
-		status = "disable";
+		status = "disabled";
 	};
 
 	sdhci@700b0400 {
@@ -408,7 +408,7 @@
 		clocks = <&tegra_car TEGRA124_CLK_SDMMC3>;
 		resets = <&tegra_car 69>;
 		reset-names = "sdhci";
-		status = "disable";
+		status = "disabled";
 	};
 
 	sdhci@700b0600 {
@@ -418,7 +418,7 @@
 		clocks = <&tegra_car TEGRA124_CLK_SDMMC4>;
 		resets = <&tegra_car 15>;
 		reset-names = "sdhci";
-		status = "disable";
+		status = "disabled";
 	};
 
 	ahub@70300000 {
-- 
1.8.4.2
