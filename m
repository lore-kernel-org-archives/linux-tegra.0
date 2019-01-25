From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 6/6] arm64: tegra: Remove regulator hacks on Jetson TX2
Date: Fri, 25 Jan 2019 12:30:13 +0100
Message-ID: <20190125113013.11447-6-thierry.reding@gmail.com>
References: <20190125113013.11447-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190125113013.11447-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Jon Hunter <jonathanh@nvidia.com>, JC Kuo <jckuo@nvidia.com>, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Various regulators were marked as always-on for Jetson TX2. At this
point, all of the regulators are properly hooked up, so this workaround
is no longer required.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../arm64/boot/dts/nvidia/tegra186-p3310.dtsi | 23 -------------------
 1 file changed, 23 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
index eb64d9be3231..0b62f80b0e86 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
@@ -266,43 +266,30 @@
 						regulator-name = "AVDD_DSI_CSI_1V2";
 						regulator-min-microvolt = <1200000>;
 						regulator-max-microvolt = <1200000>;
-						/* XXX */
-						regulator-always-on;
-						regulator-boot-on;
 					};
 
 					vdd_1v8: sd2 {
 						regulator-name = "VDD_1V8";
 						regulator-min-microvolt = <1800000>;
 						regulator-max-microvolt = <1800000>;
-						/* XXX */
-						regulator-always-on;
-						regulator-boot-on;
 					};
 
 					vdd_3v3_sys: sd3 {
 						regulator-name = "VDD_3V3_SYS";
 						regulator-min-microvolt = <3300000>;
 						regulator-max-microvolt = <3300000>;
-						/* XXX */
-						regulator-always-on;
-						regulator-boot-on;
 					};
 
 					vdd_1v8_pll: ldo0 {
 						regulator-name = "VDD_1V8_AP_PLL";
 						regulator-min-microvolt = <1800000>;
 						regulator-max-microvolt = <1800000>;
-						/* XXX */
-						regulator-always-on;
-						regulator-boot-on;
 					};
 
 					ldo2 {
 						regulator-name = "VDDIO_3V3_AOHV";
 						regulator-min-microvolt = <3300000>;
 						regulator-max-microvolt = <3300000>;
-						/* XXX */
 						regulator-always-on;
 						regulator-boot-on;
 					};
@@ -329,18 +316,12 @@
 						regulator-name = "VDD_HDMI_1V05";
 						regulator-min-microvolt = <1050000>;
 						regulator-max-microvolt = <1050000>;
-						/* XXX */
-						regulator-always-on;
-						regulator-boot-on;
 					};
 
 					vdd_pex: ldo8 {
 						regulator-name = "VDD_PEX_1V05";
 						regulator-min-microvolt = <1050000>;
 						regulator-max-microvolt = <1050000>;
-						/* XXX */
-						regulator-always-on;
-						regulator-boot-on;
 					};
 				};
 			};
@@ -388,10 +369,6 @@
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 
-			/* XXX */
-			regulator-always-on;
-			regulator-boot-on;
-
 			gpio = <&pmic 1 GPIO_ACTIVE_HIGH>;
 			enable-active-high;
 
-- 
2.19.1
