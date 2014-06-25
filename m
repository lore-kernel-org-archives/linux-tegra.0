From: Marcel Ziswiler <marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>
Subject: [PATCH] ARM: tegra: Migrate Apalis T30 PCIe power supply scheme
Date: Wed, 25 Jun 2014 22:10:01 +0200
Message-ID: <67868f9464baee36eba48582d56f586ad69d3e86.1403725976.git.marcel@ziswiler.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stefan-XLVq0VzYD2Y@public.gmane.org, Marcel Ziswiler <marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This migration is required for continued PCIe operation after commit:

d3c7e24b84fcb62f96fa9a585a41f1829f326878

Signed-off-by: Marcel Ziswiler <marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>
---
 arch/arm/boot/dts/tegra30-apalis.dtsi |   11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30-apalis.dtsi b/arch/arm/boot/dts/tegra30-apalis.dtsi
index d04efcf..8adaa78 100644
--- a/arch/arm/boot/dts/tegra30-apalis.dtsi
+++ b/arch/arm/boot/dts/tegra30-apalis.dtsi
@@ -9,9 +9,14 @@
 	compatible = "toradex,apalis_t30", "nvidia,tegra30";
 
 	pcie-controller@00003000 {
-		pex-clk-supply = <&sys_3v3_reg>;
-		vdd-supply = <&vdd2_reg>;
-		avdd-supply = <&ldo6_reg>;
+		avdd-pexa-supply = <&vdd2_reg>;
+		vdd-pexa-supply = <&vdd2_reg>;
+		avdd-pexb-supply = <&vdd2_reg>;
+		vdd-pexb-supply = <&vdd2_reg>;
+		avdd-pex-pll-supply = <&vdd2_reg>;
+		avdd-plle-supply = <&ldo6_reg>;
+		vddio-pex-ctl-supply = <&sys_3v3_reg>;
+		hvdd-pex-supply = <&sys_3v3_reg>;
 
 		pci@1,0 {
 			nvidia,num-lanes = <4>;
-- 
1.7.9.5
