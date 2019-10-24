From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v2 13/17] ARM: dts: tegra20: paz00: Set up voltage regulators for DVFS
Date: Fri, 25 Oct 2019 01:14:12 +0300
Message-ID: <20191024221416.14197-14-digetx@gmail.com>
References: <20191024221416.14197-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191024221416.14197-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Peter Geis <pgwipeout@gmail.com>, Nicolas Chauvet <kwizart@gmail.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Set min/max voltage and couple CPU/CORE/RTC regulators.

Tested-by: Nicolas Chauvet <kwizart@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20-paz00.dts | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-paz00.dts b/arch/arm/boot/dts/tegra20-paz00.dts
index 8861e0976e37..6e9fe192c648 100644
--- a/arch/arm/boot/dts/tegra20-paz00.dts
+++ b/arch/arm/boot/dts/tegra20-paz00.dts
@@ -337,18 +337,26 @@
 					regulator-always-on;
 				};
 
-				sm0 {
+				core_vdd_reg: sm0 {
 					regulator-name = "+1.2vs_sm0,vdd_core";
 					regulator-min-microvolt = <1200000>;
-					regulator-max-microvolt = <1200000>;
+					regulator-max-microvolt = <1225000>;
+					regulator-coupled-with = <&rtc_vdd_reg &cpu_vdd_reg>;
+					regulator-coupled-max-spread = <170000 450000>;
 					regulator-always-on;
+
+					nvidia,tegra-core-regulator;
 				};
 
-				sm1 {
+				cpu_vdd_reg: sm1 {
 					regulator-name = "+1.0vs_sm1,vdd_cpu";
-					regulator-min-microvolt = <1000000>;
-					regulator-max-microvolt = <1000000>;
+					regulator-min-microvolt = <750000>;
+					regulator-max-microvolt = <1100000>;
+					regulator-coupled-with = <&core_vdd_reg &rtc_vdd_reg>;
+					regulator-coupled-max-spread = <450000 450000>;
 					regulator-always-on;
+
+					nvidia,tegra-cpu-regulator;
 				};
 
 				sm2_reg: sm2 {
@@ -367,10 +375,15 @@
 					regulator-always-on;
 				};
 
-				ldo2 {
+				rtc_vdd_reg: ldo2 {
 					regulator-name = "+1.2vs_ldo2,vdd_rtc";
 					regulator-min-microvolt = <1200000>;
-					regulator-max-microvolt = <1200000>;
+					regulator-max-microvolt = <1225000>;
+					regulator-coupled-with = <&core_vdd_reg &cpu_vdd_reg>;
+					regulator-coupled-max-spread = <170000 450000>;
+					regulator-always-on;
+
+					nvidia,tegra-rtc-regulator;
 				};
 
 				ldo3 {
-- 
2.23.0
