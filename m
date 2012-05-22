From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 2/2] ARM: dt: tegra: cardhu: register core regulator tps65911
Date: Tue, 22 May 2012 18:35:17 +0530
Message-ID: <1337691917-15040-2-git-send-email-ldewangan@nvidia.com>
References: <1337691917-15040-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1337691917-15040-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: swarren@nvidia.com, olof@lixom.net, linux@arm.linux.org.uk
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Add device info for the PMIC device tps65911 in tegra-cardhu
dts file. This device supports the multiple regulator rails,
gpio, interrupts.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
---

 arch/arm/boot/dts/tegra-cardhu.dts |   94 ++++++++++++++++++++++++++++++++++++
 1 files changed, 94 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/tegra-cardhu.dts b/arch/arm/boot/dts/tegra-cardhu.dts
index 36321bc..093dde8 100644
--- a/arch/arm/boot/dts/tegra-cardhu.dts
+++ b/arch/arm/boot/dts/tegra-cardhu.dts
@@ -126,6 +126,100 @@
 			ti,vsel0-state-high;
 			ti,vsel1-state-high;
 		};
+
+		tps65911: tps65911@2d {
+			compatible = "ti,tps65911";
+			reg = <0x2d>;
+
+			#gpio-cells = <2>;
+			gpio-controller;
+
+			regulators {
+				vdd1_reg: vdd1 {
+					regulator-name = "vdd1";
+					regulator-min-microvolt = < 600000>;
+					regulator-max-microvolt = <1500000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+				vdd2_reg: vdd2 {
+					regulator-name = "vdd2";
+					regulator-min-microvolt = < 600000>;
+					regulator-max-microvolt = <1500000>;
+					regulator-boot-on;
+					regulator-always-on;
+				};
+
+				vddctrl_reg: vddctrl {
+					regulator-name = "vddctrl";
+					regulator-min-microvolt = < 600000>;
+					regulator-max-microvolt = <1400000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+				vio_reg: vio {
+					regulator-name = "vio";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+				ldo1_reg: ldo1 {
+					regulator-name = "ldo1";
+					regulator-min-microvolt = <1000000>;
+					regulator-max-microvolt = <3300000>;
+				};
+
+				ldo2_reg: ldo2 {
+					regulator-name = "ldo2";
+					regulator-min-microvolt = <1050000>;
+					regulator-max-microvolt = <1050000>;
+				};
+
+				ldo3_reg: ldo3 {
+					regulator-name = "ldo3";
+					regulator-min-microvolt = <1000000>;
+					regulator-max-microvolt = <3300000>;
+				};
+
+				ldo4_reg: ldo4 {
+					regulator-name = "ldo4";
+					regulator-min-microvolt = <1000000>;
+					regulator-max-microvolt = <3300000>;
+					regulator-always-on;
+				};
+
+				ldo5_reg: ldo5 {
+					regulator-name = "ldo5";
+					regulator-min-microvolt = <1000000>;
+					regulator-max-microvolt = <3300000>;
+				};
+
+				ldo6_reg: ldo6 {
+					regulator-name = "ldo6";
+					regulator-min-microvolt = <1200000>;
+					regulator-max-microvolt = <1200000>;
+				};
+
+				ldo7_reg: ldo7 {
+					regulator-name = "ldo7";
+					regulator-min-microvolt = <1200000>;
+					regulator-max-microvolt = <1200000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+				ldo8_reg: ldo8 {
+					regulator-name = "ldo8";
+					regulator-min-microvolt = <1000000>;
+					regulator-max-microvolt = <3300000>;
+					regulator-always-on;
+				};
+			};
+		};
 	};
 
 	ahub {
-- 
1.7.1.1
