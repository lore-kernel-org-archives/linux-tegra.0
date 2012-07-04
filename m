From: Wei Ni <wni@nvidia.com>
Subject: [PATCH 3/5] ARM: dt: t20 ventana: add pinmux, gpio for wlan
Date: Wed, 4 Jul 2012 17:34:46 +0800
Message-ID: <1341394488-13169-4-git-send-email-wni@nvidia.com>
References: <1341394488-13169-1-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1341394488-13169-1-git-send-email-wni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: swarren@nvidia.com, olof@lixom.net, ccross@android.com
Cc: linux@arm.linux.org.uk, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, ldewangan@nvidia.com, arnd@arndb.de, grant.likely@secretlab.ca, cjb@laptop.org, Wei Ni <wni@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

This adds wlan pinmux and gpio settings to the Tegra20 Ventana device tree.

Signed-off-by: Wei Ni <wni@nvidia.com>
---
 arch/arm/boot/dts/tegra20-ventana.dts |   20 ++++++++++++++++++--
 1 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-ventana.dts b/arch/arm/boot/dts/tegra20-ventana.dts
index be90544..42dbacc 100644
--- a/arch/arm/boot/dts/tegra20-ventana.dts
+++ b/arch/arm/boot/dts/tegra20-ventana.dts
@@ -198,7 +198,8 @@
 				nvidia,tristate = <1>;
 			};
 			conf_dta {
-				nvidia,pins = "dta", "dtb", "dtc", "dtd";
+				nvidia,pins = "dta", "dtb", "dtc", "dtd",
+					"kbcb";
 				nvidia,pull = <1>;
 				nvidia,tristate = <0>;
 			};
@@ -213,7 +214,7 @@
 				nvidia,tristate = <1>;
 			};
 			conf_kbca {
-				nvidia,pins = "kbca", "kbcb", "kbcc", "kbcd",
+				nvidia,pins = "kbca", "kbcc", "kbcd",
 					"kbce", "kbcf", "sdio1", "uaa", "uab";
 				nvidia,pull = <2>;
 				nvidia,tristate = <0>;
@@ -237,6 +238,16 @@
 					"ld23_22";
 				nvidia,pull = <1>;
 			};
+			drive_sdio1 {
+				nvidia,pins = "drive_sdio1";
+				nvidia,high-speed-mode = <0>;
+				nvidia,schmitt = <1>;
+				nvidia,low-power-mode = <3>;
+				nvidia,pull-down-strength = <31>;
+				nvidia,pull-up-strength = <31>;
+				nvidia,slew-rate-rising = <3>;
+				nvidia,slew-rate-falling = <3>;
+			};
 		};
 	};
 
@@ -304,6 +315,11 @@
 		status = "okay";
 	};
 
+	sdhci@c8000000 {
+		status = "okay";
+		power-gpios = <&gpio 86 0>; /* gpio PK6 */
+	};
+
 	sdhci@c8000400 {
 		status = "okay";
 		cd-gpios = <&gpio 69 0>; /* gpio PI5 */
-- 
1.7.1
