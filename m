From: Stephen Warren <swarren@wwwdotorg.org>
Subject: [PATCH V2 2/6] ARM: tegra: fix sort order of USB PHY nodes
Date: Wed,  6 Mar 2013 11:28:33 -0700
Message-ID: <1362594517-22099-2-git-send-email-swarren@wwwdotorg.org>
References: <1362594517-22099-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1362594517-22099-1-git-send-email-swarren@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Michal Marek <mmarek@suse.cz>, Shawn Guo <shawn.guo@linaro.org>, linux-kbuild@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, Stephen Warren <swarren@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren@nvidia.com>

The USB PHY nodes are all grouped together rather than being sorted based
on reg address like all other nodes fix this.

I apologize for the churn; I should have noticed this during review of the
patches that caused this.

Signed-off-by: Stephen Warren <swarren@nvidia.com>
---
 arch/arm/boot/dts/tegra20.dtsi |   50 ++++++++++++++++++++--------------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index ab9402a..7708975 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -438,31 +438,6 @@
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
@@ -475,6 +450,15 @@
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
@@ -485,6 +469,14 @@
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
@@ -495,6 +487,14 @@
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
