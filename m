From: Eric Brower <ebrower-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 1/2] ARM: tegra: modify Tegra30 USB2 default phy_type to UTMI
Date: Thu, 19 Dec 2013 18:08:52 -0800
Message-ID: <1387505333-3767-1-git-send-email-ebrower@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Eric Brower <ebrower-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Modify Tegra30 default USB2 phy_type to UTMI; this matches
power-on-reset defaults and is expected to be the common case.

The current implementation is likely an incorrect
carry-over from Tegra20, where USB2 does default to ULPI.

Signed-off-by: Eric Brower <ebrower-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
No upstream Tegra30 dts files reference USB2, so this should be a
safe change; anyone using an out-of-tree dts with USB2, sparsely
populated from the Tegra30 dtsi, may have an issue.

v2: modified register base address for USB2 bias pad regs

 arch/arm/boot/dts/tegra30.dtsi | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
index 2bd55cf..8bb8c46 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -669,7 +669,7 @@
 		compatible = "nvidia,tegra30-ehci", "usb-ehci";
 		reg = <0x7d004000 0x4000>;
 		interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
-		phy_type = "ulpi";
+		phy_type = "utmi";
 		clocks = <&tegra_car TEGRA30_CLK_USB2>;
 		nvidia,phy = <&phy2>;
 		status = "disabled";
@@ -677,12 +677,23 @@
 
 	phy2: usb-phy@7d004000 {
 		compatible = "nvidia,tegra30-usb-phy";
-		reg = <0x7d004000 0x4000>;
-		phy_type = "ulpi";
+		reg = <0x7d004000 0x4000 0x7d000000 0x4000>;
+		phy_type = "utmi";
 		clocks = <&tegra_car TEGRA30_CLK_USB2>,
 			 <&tegra_car TEGRA30_CLK_PLL_U>,
-			 <&tegra_car TEGRA30_CLK_CDEV2>;
-		clock-names = "reg", "pll_u", "ulpi-link";
+			 <&tegra_car TEGRA30_CLK_USBD>;
+		clock-names = "reg", "pll_u", "utmi-pads";
+		nvidia,hssync-start-delay = <9>;
+		nvidia,idle-wait-delay = <17>;
+		nvidia,elastic-limit = <16>;
+		nvidia,term-range-adj = <6>;
+		nvidia,xcvr-setup = <51>;
+		nvidia.xcvr-setup-use-fuses;
+		nvidia,xcvr-lsfslew = <2>;
+		nvidia,xcvr-lsrslew = <2>;
+		nvidia,xcvr-hsslew = <32>;
+		nvidia,hssquelch-level = <2>;
+		nvidia,hsdiscon-level = <5>;
 		status = "disabled";
 	};
 
-- 
1.8.1.5
