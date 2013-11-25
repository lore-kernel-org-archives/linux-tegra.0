From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 4/4] ARM: tegra: add MMC controllers to Tegra124 DT
Date: Mon, 25 Nov 2013 15:39:20 -0700
Message-ID: <1385419160-11511-4-git-send-email-swarren@wwwdotorg.org>
References: <1385419160-11511-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1385419160-11511-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Tegra124 has 4 MMC controllers just like previous versions of the SoC.
Note that there are some non-backwards-compatible HW differences, and
hence a new DT compatible value must be used to describe the HW.

Also enable the relevant controllers in the Venice2 board DT.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra124-venice2.dts | 11 ++++++++++
 arch/arm/boot/dts/tegra124.dtsi        | 40 ++++++++++++++++++++++++++++++++++
 2 files changed, 51 insertions(+)

diff --git a/arch/arm/boot/dts/tegra124-venice2.dts b/arch/arm/boot/dts/tegra124-venice2.dts
index a0b028384658..bc502112eb04 100644
--- a/arch/arm/boot/dts/tegra124-venice2.dts
+++ b/arch/arm/boot/dts/tegra124-venice2.dts
@@ -25,6 +25,17 @@
 		nvidia,sys-clock-req-active-high;
 	};
 
+	sdhci@700b0400 {
+		cd-gpios = <&gpio TEGRA_GPIO(V, 2) GPIO_ACTIVE_HIGH>;
+		status = "okay";
+		bus-width = <4>;
+	};
+
+	sdhci@700b0600 {
+		status = "okay";
+		bus-width = <8>;
+	};
+
 	clocks {
 		compatible = "simple-bus";
 		#address-cells = <1>;
diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
index 96e051e13f76..200373236aaa 100644
--- a/arch/arm/boot/dts/tegra124.dtsi
+++ b/arch/arm/boot/dts/tegra124.dtsi
@@ -190,6 +190,46 @@
 		clock-names = "pclk", "clk32k_in";
 	};
 
+	sdhci@700b0000 {
+		compatible = "nvidia,tegra124-sdhci";
+		reg = <0x700b0000 0x200>;
+		interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&tegra_car TEGRA124_CLK_SDMMC1>;
+		resets = <&tegra_car 14>;
+		reset-names = "sdhci";
+		status = "disable";
+	};
+
+	sdhci@700b0200 {
+		compatible = "nvidia,tegra124-sdhci";
+		reg = <0x700b0200 0x200>;
+		interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&tegra_car TEGRA124_CLK_SDMMC2>;
+		resets = <&tegra_car 9>;
+		reset-names = "sdhci";
+		status = "disable";
+	};
+
+	sdhci@700b0400 {
+		compatible = "nvidia,tegra124-sdhci";
+		reg = <0x700b0400 0x200>;
+		interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&tegra_car TEGRA124_CLK_SDMMC3>;
+		resets = <&tegra_car 69>;
+		reset-names = "sdhci";
+		status = "disable";
+	};
+
+	sdhci@700b0600 {
+		compatible = "nvidia,tegra124-sdhci";
+		reg = <0x700b0600 0x200>;
+		interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&tegra_car TEGRA124_CLK_SDMMC4>;
+		resets = <&tegra_car 15>;
+		reset-names = "sdhci";
+		status = "disable";
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
-- 
1.8.1.5
