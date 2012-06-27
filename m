From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH V2] ARM: dt: tegra: paz00: add regulators
Date: Tue, 26 Jun 2012 18:31:00 -0600
Message-ID: <1340757060-27232-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The Toshiba AC100/PAZ00 uses a TPS6586x regulator. Instantiate this.

Three data sources were used for the data encoded here:
* The HW defaults, as extracted from real HW.
* The schematic, which specifies a voltage for each rail in the signal
  names.
* The AC100 kernel used by the Ubuntu port:

  repo git://gitorious.org/~marvin24/ac100/marvin24s-kernel.git
  branch chromeos-ac100-3.0
  file arch/arm/mach-tegra/board-paz00-power.c

  For many rails, the constraints in that tree specified differing min
  and max voltages. In all cases, the min value was ignored, since
  there's no need currently to vary any of the voltages at run-time.
  DVFS might change this in the future.

In most cases these sources all matched. Differences are:

sm0: HW defaults and schematic match at 1.2v. marvin24's kernel had a max
of 1.3v, but this wasn't applied since apply_uV wasn't set.

sm1: HW defaults and schematic match at 1.0v. marvin24's kernel had a max
of 1.125v, but this wasn't applied since apply_uV wasn't set.

ldo0: The HW default is 1.2v. The schematic and marvin24's kernel state
this should be 3.3v. On similar board designs, this rail is typically
used for PCIe clock which requires 3.3v. Note that this rail isn't
actually used on this board.

ldo3: The HW default is on. marvin24's kernel didn't specify always-on,
but since the board wasn't marked as having fully constrained regulators,
the rail was not turned off, so the difference had no effect. The rail
is needed for USB.

Cc: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
v2:
* Made all constraints specify a single voltage rather than different
  min/max, per description above.
* Removed vin-supply properties from LDO nodes; the driver and binding
  need to be updated to support specifying the parent regulators before
  we can put these into DT.
---
 arch/arm/boot/dts/tegra20-paz00.dts |  130 +++++++++++++++++++++++++++++++++++
 1 files changed, 130 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-paz00.dts b/arch/arm/boot/dts/tegra20-paz00.dts
index 684a9e1..dccc8b4 100644
--- a/arch/arm/boot/dts/tegra20-paz00.dts
+++ b/arch/arm/boot/dts/tegra20-paz00.dts
@@ -272,12 +272,142 @@
 		status = "okay";
 		clock-frequency = <400000>;
 
+		pmic: tps6586x@34 {
+			compatible = "ti,tps6586x";
+			reg = <0x34>;
+			interrupts = <0 86 0x4>;
+
+			#gpio-cells = <2>;
+			gpio-controller;
+
+			regulators {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				regulator@0 {
+					reg = <0>;
+					regulator-compatible = "sm0";
+					regulator-name = "+1.2vs_sm0";
+					regulator-min-microvolt = <1200000>;
+					regulator-max-microvolt = <1200000>;
+					regulator-always-on;
+				};
+
+				regulator@1 {
+					reg = <1>;
+					regulator-compatible = "sm1";
+					regulator-name = "+1.0vs_sm1";
+					regulator-min-microvolt = <1000000>;
+					regulator-max-microvolt = <1000000>;
+					regulator-always-on;
+				};
+
+				regulator@2 {
+					reg = <2>;
+					regulator-compatible = "sm2";
+					regulator-name = "+3.7vs_sm2";
+					regulator-min-microvolt = <3700000>;
+					regulator-max-microvolt = <3700000>;
+					regulator-always-on;
+				};
+
+				regulator@3 {
+					reg = <3>;
+					regulator-compatible = "ldo0";
+					regulator-name = "+3.3vs_ldo0";
+					regulator-min-microvolt = <3300000>;
+					regulator-max-microvolt = <3300000>;
+				};
+
+				regulator@4 {
+					reg = <4>;
+					regulator-compatible = "ldo1";
+					regulator-name = "+1.1vs_ldo1";
+					regulator-min-microvolt = <1100000>;
+					regulator-max-microvolt = <1100000>;
+					regulator-always-on;
+				};
+
+				regulator@5 {
+					reg = <5>;
+					regulator-compatible = "ldo2";
+					regulator-name = "+1.2vs_ldo2";
+					regulator-min-microvolt = <1200000>;
+					regulator-max-microvolt = <1200000>;
+				};
+
+				regulator@6 {
+					reg = <6>;
+					regulator-compatible = "ldo3";
+					regulator-name = "+3.3vs_ldo3";
+					regulator-min-microvolt = <3300000>;
+					regulator-max-microvolt = <3300000>;
+					regulator-always-on;
+				};
+
+				regulator@7 {
+					reg = <7>;
+					regulator-compatible = "ldo4";
+					regulator-name = "+1.8vs_ldo4";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					regulator-always-on;
+				};
+
+				regulator@8 {
+					reg = <8>;
+					regulator-compatible = "ldo5";
+					regulator-name = "+2.85vs_ldo5";
+					regulator-min-microvolt = <2850000>;
+					regulator-max-microvolt = <2850000>;
+					regulator-always-on;
+				};
+
+				regulator@9 {
+					reg = <9>;
+					regulator-compatible = "ldo6";
+					regulator-name = "+2.85vs_ldo6";
+					regulator-min-microvolt = <2850000>;
+					regulator-max-microvolt = <2850000>;
+				};
+
+				regulator@10 {
+					reg = <10>;
+					regulator-compatible = "ldo7";
+					regulator-name = "+3.3vs_ldo7";
+					regulator-min-microvolt = <3300000>;
+					regulator-max-microvolt = <3300000>;
+				};
+
+				regulator@11 {
+					reg = <11>;
+					regulator-compatible = "ldo8";
+					regulator-name = "+1.8vs_ldo8";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+				};
+
+				regulator@12 {
+					reg = <12>;
+					regulator-compatible = "ldo9";
+					regulator-name = "+2.85vs_ldo9";
+					regulator-min-microvolt = <2850000>;
+					regulator-max-microvolt = <2850000>;
+					regulator-always-on;
+				};
+			};
+		};
+
 		adt7461@4c {
 			compatible = "adi,adt7461";
 			reg = <0x4c>;
 		};
 	};
 
+	pmc {
+		nvidia,invert-interrupt;
+	};
+
 	usb@c5000000 {
 		status = "okay";
 	};
-- 
1.7.0.4
