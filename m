From: Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 1/2] ARM: tegra: Add Tegra124 HDA support
Date: Mon, 19 May 2014 19:35:45 -0700
Message-ID: <1400553346-23238-1-git-send-email-dgreid@chromium.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add a device node for the HDA controller found on Tegra124.

Signed-off-by: Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 arch/arm/boot/dts/tegra124.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
index 6e6bc4e..7890641 100644
--- a/arch/arm/boot/dts/tegra124.dtsi
+++ b/arch/arm/boot/dts/tegra124.dtsi
@@ -449,6 +449,21 @@
 		clock-names = "pclk", "clk32k_in";
 	};
 
+	hda@0,70030000 {
+		compatible = "nvidia,tegra124-hda", "nvidia,tegra30-hda";
+		reg = <0x0 0x70030000 0x0 0x10000>;
+		interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&tegra_car TEGRA124_CLK_HDA>,
+		         <&tegra_car TEGRA124_CLK_HDA2HDMI>,
+			 <&tegra_car TEGRA124_CLK_HDA2CODEC_2X>;
+		clock-names = "hda", "hda2hdmi", "hdacodec_2x";
+		resets = <&tegra_car 125>, /* hda */
+			 <&tegra_car 128>, /* hda2hdmi */
+			 <&tegra_car 111>; /* hda2codec_2x */
+		reset-names = "hda", "hda2hdmi", "hdacodec_2x";
+		status = "disabled";
+	};
+
 	sdhci@0,700b0000 {
 		compatible = "nvidia,tegra124-sdhci";
 		reg = <0x0 0x700b0000 0x0 0x200>;
-- 
1.8.1.3.605.g02339dd

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
