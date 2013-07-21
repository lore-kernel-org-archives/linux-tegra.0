From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: [PATCH 4/4] ARM: tegra: correct Colibri T20 regulator settings
Date: Sun, 21 Jul 2013 23:28:52 +0200
Message-ID: <1374442132-24040-5-git-send-email-dev@lynxeye.de>
References: <1374442132-24040-1-git-send-email-dev@lynxeye.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1374442132-24040-1-git-send-email-dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Core and CPU voltage settings were a bit on the safe side. The actually
used chips on the Colibri allow for lower voltages and work just fine
this way.

SM2 is not a the parent of LDO regs, but actually the DDR regulator. The
Colibri uses a different version of the TPS with other voltage mapping
tables for SM2, currently we cheat by setting a fake 3,2V which results
in 1,8V physical.

Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
---
The issue with the used version of the PMIC having a different voltage
mapping for SM2 should be resolved properly. As this needs some bigger
adjustments at the regulator driver this quick fix is just aimed at
stopping slight overvolting of the ram with 3.11 kernels. A proper fix
should land in time for 3.12.
---
 arch/arm/boot/dts/tegra20-colibri-512.dtsi | 33 ++++++++++++++++--------------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-colibri-512.dtsi b/arch/arm/boot/dts/tegra20-colibri-512.dtsi
index 92551ba..9b56dcb 100644
--- a/arch/arm/boot/dts/tegra20-colibri-512.dtsi
+++ b/arch/arm/boot/dts/tegra20-colibri-512.dtsi
@@ -226,14 +226,14 @@
 			gpio-controller;
 
 			sys-supply = <&vdd_5v0_reg>;
-			vin-sm0-supply = <&sys_reg>;
-			vin-sm1-supply = <&sys_reg>;
-			vin-sm2-supply = <&sys_reg>;
-			vinldo01-supply = <&sm2_reg>;
-			vinldo23-supply = <&sm2_reg>;
-			vinldo4-supply = <&sm2_reg>;
-			vinldo678-supply = <&sm2_reg>;
-			vinldo9-supply = <&sm2_reg>;
+			vin-sm0-supply = <&vdd_5v0_reg>;
+			vin-sm1-supply = <&vdd_5v0_reg>;
+			vin-sm2-supply = <&vdd_5v0_reg>;
+			vinldo01-supply = <&vdd_5v0_reg>;
+			vinldo23-supply = <&vdd_5v0_reg>;
+			vinldo4-supply = <&vdd_5v0_reg>;
+			vinldo678-supply = <&vdd_5v0_reg>;
+			vinldo9-supply = <&vdd_5v0_reg>;
 
 			regulators {
 				#address-cells = <1>;
@@ -250,8 +250,8 @@
 					reg = <1>;
 					regulator-compatible = "sm0";
 					regulator-name = "vdd_sm0,vdd_core";
-					regulator-min-microvolt = <1275000>;
-					regulator-max-microvolt = <1275000>;
+					regulator-min-microvolt = <1225000>;
+					regulator-max-microvolt = <1225000>;
 					regulator-always-on;
 				};
 
@@ -259,17 +259,20 @@
 					reg = <2>;
 					regulator-compatible = "sm1";
 					regulator-name = "vdd_sm1,vdd_cpu";
-					regulator-min-microvolt = <1100000>;
-					regulator-max-microvolt = <1100000>;
+					regulator-min-microvolt = <1025000>;
+					regulator-max-microvolt = <1025000>;
 					regulator-always-on;
 				};
 
 				sm2_reg: regulator@3 {
 					reg = <3>;
 					regulator-compatible = "sm2";
-					regulator-name = "vdd_sm2,vin_ldo*";
-					regulator-min-microvolt = <3700000>;
-					regulator-max-microvolt = <3700000>;
+					regulator-name = "vdd_sm2,vdd_ddr";
+					/* The voltage is lying, but results
+					in the desired 1,8V on the TPS version
+					used on the Colibri */
+					regulator-min-microvolt = <3200000>;
+					regulator-max-microvolt = <3200000>;
 					regulator-always-on;
 				};
 
-- 
1.8.3.1
