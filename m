From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 5/9] ARM: tegra: fix sort order of USB PHY nodes
Date: Wed, 13 Feb 2013 14:33:14 -0700
Message-ID: <1360791198-29462-6-git-send-email-swarren@wwwdotorg.org>
References: <1360791198-29462-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1360791198-29462-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The USB PHY nodes are all grouped together rather than being sorted based
on reg address like all other nodes fix this.

I apologize for the churn; I should have noticed this during review of the
patches that caused this.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra20.dtsi |   50 ++++++++++++++++++++--------------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index f3c7681..5916c93 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -442,31 +442,6 @@
 		#size-cells = <0>;
 	};
 
-	phy1: usb-phy@c5000400 {
-		compatible = "nvidia,tegra20-usb-phy";
-		reg = <0xc5000400 0x3c00>;
-		phy_type = "utmi";
-		nvidia,has-legacy-mode;
-		clocks = <&tegra_car 22>, <&tegra_car 127>;
-		clock-names = "phy", "pll_u";
-	};
-
-	phy2: usb-phy@c5004400 {
-		compatible = "nvidia,tegra20-usb-phy";
-		reg = <0xc5004400 0x3c00>;
-		phy_type = "ulpi";
-		clocks = <&tegra_car 94>, <&tegra_car 127>;
-		clock-names = "phy", "pll_u";
-	};
-
-	phy3: usb-phy@c5008400 {
-		compatible = "nvidia,tegra20-usb-phy";
-		reg = <0xc5008400 0x3C00>;
-		phy_type = "utmi";
-		clocks = <&tegra_car 22>, <&tegra_car 127>;
-		clock-names = "phy", "pll_u";
-	};
-
 	usb@c5000000 {
 		compatible = "nvidia,tegra20-ehci", "usb-ehci";
 		reg = <0xc5000000 0x4000>;
@@ -479,6 +454,15 @@
 		status = "disabled";
 	};
 
+	phy1: usb-phy@c5000400 {
+		compatible = "nvidia,tegra20-usb-phy";
+		reg = <0xc5000400 0x3c00>;
+		phy_type = "utmi";
+		nvidia,has-legacy-mode;
+		clocks = <&tegra_car 22>, <&tegra_car 127>;
+		clock-names = "phy", "pll_u";
+	};
+
 	usb@c5004000 {
 		compatible = "nvidia,tegra20-ehci", "usb-ehci";
 		reg = <0xc5004000 0x4000>;
@@ -489,6 +473,14 @@
 		status = "disabled";
 	};
 
+	phy2: usb-phy@c5004400 {
+		compatible = "nvidia,tegra20-usb-phy";
+		reg = <0xc5004400 0x3c00>;
+		phy_type = "ulpi";
+		clocks = <&tegra_car 94>, <&tegra_car 127>;
+		clock-names = "phy", "pll_u";
+	};
+
 	usb@c5008000 {
 		compatible = "nvidia,tegra20-ehci", "usb-ehci";
 		reg = <0xc5008000 0x4000>;
@@ -499,6 +491,14 @@
 		status = "disabled";
 	};
 
+	phy3: usb-phy@c5008400 {
+		compatible = "nvidia,tegra20-usb-phy";
+		reg = <0xc5008400 0x3c00>;
+		phy_type = "utmi";
+		clocks = <&tegra_car 22>, <&tegra_car 127>;
+		clock-names = "phy", "pll_u";
+	};
+
 	sdhci@c8000000 {
 		compatible = "nvidia,tegra20-sdhci";
 		reg = <0xc8000000 0x200>;
-- 
1.7.10.4
