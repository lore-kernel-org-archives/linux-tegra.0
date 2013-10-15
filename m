From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 07/13] ARM: tegra: Add Tegra114 gr2d support
Date: Tue, 15 Oct 2013 17:27:57 +0200
Message-ID: <1381850883-12722-8-git-send-email-treding@nvidia.com>
References: <1381850883-12722-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381850883-12722-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Add the device tree for the gr2d hardware found on Tegra114 SoCs.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Changes in v2:
- mark as backwards-compatible with Tegra20

 arch/arm/boot/dts/tegra114.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi
index 7905b2e..d8a3d61 100644
--- a/arch/arm/boot/dts/tegra114.dtsi
+++ b/arch/arm/boot/dts/tegra114.dtsi
@@ -27,6 +27,13 @@
 
 		ranges = <0x54000000 0x54000000 0x01000000>;
 
+		gr2d@54140000 {
+			compatible = "nvidia,tegra114-gr2d", "nvidia,tegra20-gr2d";
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
