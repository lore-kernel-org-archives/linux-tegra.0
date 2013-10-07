From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 6/9] ARM: tegra: Add Tegra114 gr2d support
Date: Mon,  7 Oct 2013 13:48:45 +0200
Message-ID: <1381146528-18069-7-git-send-email-treding@nvidia.com>
References: <1381146528-18069-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381146528-18069-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Add the device tree for the gr2d hardware found on Tegra114 SoCs.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra114.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi
index a79b44b..570d26b 100644
--- a/arch/arm/boot/dts/tegra114.dtsi
+++ b/arch/arm/boot/dts/tegra114.dtsi
@@ -28,6 +28,13 @@
 
 		ranges = <0x54000000 0x54000000 0x01000000>;
 
+		gr2d@54140000 {
+			compatible = "nvidia,tegra114-gr2d";
+			reg = <0x54140000 0x00040000>;
+			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&tegra_car TEGRA114_CLK_GR2D>;
+		};
+
 		dc@54200000 {
 			compatible = "nvidia,tegra114-dc", "nvidia,tegra20-dc";
 			reg = <0x54200000 0x00040000>;
-- 
1.8.4
