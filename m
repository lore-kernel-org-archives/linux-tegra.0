From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 12/17] ARM: dts: tegra30: Add CPU Operating Performance Points
Date: Wed, 16 Oct 2019 00:16:13 +0300
Message-ID: <20191015211618.20758-13-digetx@gmail.com>
References: <20191015211618.20758-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191015211618.20758-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Peter Geis <pgwipeout@gmail.com>, Nicolas Chauvet <kwizart@gmail.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Operating Point are specified per HW version. The OPP voltages are kept
in a separate DTSI file because some boards may not define CPU regulator
in their device-tree if voltage scaling isn't necessary for them.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../boot/dts/tegra30-cpu-opp-microvolt.dtsi   |  801 +++++++++++
 arch/arm/boot/dts/tegra30-cpu-opp.dtsi        | 1202 +++++++++++++++++
 2 files changed, 2003 insertions(+)
 create mode 100644 arch/arm/boot/dts/tegra30-cpu-opp-microvolt.dtsi
 create mode 100644 arch/arm/boot/dts/tegra30-cpu-opp.dtsi

diff --git a/arch/arm/boot/dts/tegra30-cpu-opp-microvolt.dtsi b/arch/arm/boot/dts/tegra30-cpu-opp-microvolt.dtsi
new file mode 100644
index 000000000000..5c40ef49894f
--- /dev/null
+++ b/arch/arm/boot/dts/tegra30-cpu-opp-microvolt.dtsi
@@ -0,0 +1,801 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/ {
+	cpu0_opp_table: cpu_opp_table0 {
+		opp@51000000_800 {
+			opp-microvolt = <800000 800000 1250000>;
+		};
+
+		opp@51000000_850 {
+			opp-microvolt = <850000 850000 1250000>;
+		};
+
+		opp@51000000_912 {
+			opp-microvolt = <912000 912000 1250000>;
+		};
+
+		opp@102000000_800 {
+			opp-microvolt = <800000 800000 1250000>;
+		};
+
+		opp@102000000_850 {
+			opp-microvolt = <850000 850000 1250000>;
+		};
+
+		opp@102000000_912 {
+			opp-microvolt = <912000 912000 1250000>;
+		};
+
+		opp@204000000_800 {
+			opp-microvolt = <800000 800000 1250000>;
+		};
+
+		opp@204000000_850 {
+			opp-microvolt = <850000 850000 1250000>;
+		};
+
+		opp@204000000_912 {
+			opp-microvolt = <912000 912000 1250000>;
+		};
+
+		opp@312000000_850 {
+			opp-microvolt = <850000 850000 1250000>;
+		};
+
+		opp@312000000_912 {
+			opp-microvolt = <912000 912000 1250000>;
+		};
+
+		opp@340000000_800 {
+			opp-microvolt = <800000 800000 1250000>;
+		};
+
+		opp@340000000_850 {
+			opp-microvolt = <850000 850000 1250000>;
+		};
+
+		opp@370000000_800 {
+			opp-microvolt = <800000 800000 1250000>;
+		};
+
+		opp@456000000_850 {
+			opp-microvolt = <850000 850000 1250000>;
+		};
+
+		opp@456000000_912 {
+			opp-microvolt = <912000 912000 1250000>;
+		};
+
+		opp@475000000_800 {
+			opp-microvolt = <800000 800000 1250000>;
+		};
+
+		opp@475000000_850 {
+			opp-microvolt = <850000 850000 1250000>;
+		};
+
+		opp@475000000_850_0_1 {
+			opp-microvolt = <850000 850000 1250000>;
+		};
+
+		opp@475000000_850_0_4 {
+			opp-microvolt = <850000 850000 1250000>;
+		};
+
+		opp@475000000_850_0_7 {
+			opp-microvolt = <850000 850000 1250000>;
+		};
+
+		opp@475000000_850_0_8 {
+			opp-microvolt = <850000 850000 1250000>;
+		};
+
+		opp@608000000_850 {
+			opp-microvolt = <850000 850000 1250000>;
+		};
+
+		opp@608000000_912 {
+			opp-microvolt = <912000 912000 1250000>;
+		};
+
+		opp@620000000_850 {
+			opp-microvolt = <850000 850000 1250000>;
+		};
+
+		opp@640000000_850 {
+			opp-microvolt = <850000 850000 1250000>;
+		};
+
+		opp@640000000_850_1_1 {
+			opp-microvolt = <850000 850000 1250000>;
+		};
+
+		opp@640000000_850_2_1 {
+			opp-microvolt = <850000 850000 1250000>;
+		};
+
+		opp@640000000_850_3_1 {
+			opp-microvolt = <850000 850000 1250000>;
+		};
+
+		opp@640000000_850_1_4 {
+			opp-microvolt = <850000 850000 1250000>;
+		};
+
+		opp@640000000_850_2_4 {
+			opp-microvolt = <850000 850000 1250000>;
+		};
+
+		opp@640000000_850_3_4 {
+			opp-microvolt = <850000 850000 1250000>;
+		};
+
+		opp@640000000_850_1_7 {
+			opp-microvolt = <850000 850000 1250000>;
+		};
+
+		opp@640000000_850_2_7 {
+			opp-microvolt = <850000 850000 1250000>;
+		};
+
+		opp@640000000_850_3_7 {
+			opp-microvolt = <850000 850000 1250000>;
+		};
+
+		opp@640000000_850_4_7 {
+			opp-microvolt = <850000 850000 1250000>;
+		};
+
+		opp@640000000_850_1_8 {
+			opp-microvolt = <850000 850000 1250000>;
+		};
+
+		opp@640000000_850_2_8 {
+			opp-microvolt = <850000 850000 1250000>;
+		};
+
+		opp@640000000_850_3_8 {
+			opp-microvolt = <850000 850000 1250000>;
+		};
+
+		opp@640000000_850_4_8 {
+			opp-microvolt = <850000 850000 1250000>;
+		};
+
+		opp@640000000_900 {
+			opp-microvolt = <900000 900000 1250000>;
+		};
+
+		opp@760000000_850 {
+			opp-microvolt = <850000 850000 1250000>;
+		};
+
+		opp@760000000_850_3_1 {
+			opp-microvolt = <850000 850000 1250000>;
+		};
+
+		opp@760000000_850_3_2 {
+			opp-microvolt = <850000 850000 1250000>;
+		};
+
+		opp@760000000_850_3_3 {
+			opp-microvolt = <850000 850000 1250000>;
+		};
+
+		opp@760000000_850_3_4 {
+			opp-microvolt = <850000 850000 1250000>;
+		};
+
+		opp@760000000_850_3_7 {
+			opp-microvolt = <850000 850000 1250000>;
+		};
+
+		opp@760000000_850_4_7 {
+			opp-microvolt = <850000 850000 1250000>;
+		};
+
+		opp@760000000_850_3_8 {
+			opp-microvolt = <850000 850000 1250000>;
+		};
+
+		opp@760000000_850_4_8 {
+			opp-microvolt = <850000 850000 1250000>;
+		};
+
+		opp@760000000_850_0_10 {
+			opp-microvolt = <850000 850000 1250000>;
+		};
+
+		opp@760000000_900 {
+			opp-microvolt = <900000 900000 1250000>;
+		};
+
+		opp@760000000_900_1_1 {
+			opp-microvolt = <900000 900000 1250000>;
+		};
+
+		opp@760000000_900_2_1 {
+			opp-microvolt = <900000 900000 1250000>;
+		};
+
+		opp@760000000_900_1_2 {
+			opp-microvolt = <900000 900000 1250000>;
+		};
+
+		opp@760000000_900_2_2 {
+			opp-microvolt = <900000 900000 1250000>;
+		};
+
+		opp@760000000_900_1_3 {
+			opp-microvolt = <900000 900000 1250000>;
+		};
+
+		opp@760000000_900_2_3 {
+			opp-microvolt = <900000 900000 1250000>;
+		};
+
+		opp@760000000_900_1_4 {
+			opp-microvolt = <900000 900000 1250000>;
+		};
+
+		opp@760000000_900_2_4 {
+			opp-microvolt = <900000 900000 1250000>;
+		};
+
+		opp@760000000_900_1_7 {
+			opp-microvolt = <900000 900000 1250000>;
+		};
+
+		opp@760000000_900_2_7 {
+			opp-microvolt = <900000 900000 1250000>;
+		};
+
+		opp@760000000_900_1_8 {
+			opp-microvolt = <900000 900000 1250000>;
+		};
+
+		opp@760000000_900_2_8 {
+			opp-microvolt = <900000 900000 1250000>;
+		};
+
+		opp@760000000_912 {
+			opp-microvolt = <912000 912000 1250000>;
+		};
+
+		opp@760000000_975 {
+			opp-microvolt = <975000 975000 1250000>;
+		};
+
+		opp@816000000_850 {
+			opp-microvolt = <850000 850000 1250000>;
+		};
+
+		opp@816000000_912 {
+			opp-microvolt = <912000 912000 1250000>;
+		};
+
+		opp@860000000_850 {
+			opp-microvolt = <850000 850000 1250000>;
+		};
+
+		opp@860000000_900 {
+			opp-microvolt = <900000 900000 1250000>;
+		};
+
+		opp@860000000_900_2_1 {
+			opp-microvolt = <900000 900000 1250000>;
+		};
+
+		opp@860000000_900_3_1 {
+			opp-microvolt = <900000 900000 1250000>;
+		};
+
+		opp@860000000_900_2_2 {
+			opp-microvolt = <900000 900000 1250000>;
+		};
+
+		opp@860000000_900_3_2 {
+			opp-microvolt = <900000 900000 1250000>;
+		};
+
+		opp@860000000_900_2_3 {
+			opp-microvolt = <900000 900000 1250000>;
+		};
+
+		opp@860000000_900_3_3 {
+			opp-microvolt = <900000 900000 1250000>;
+		};
+
+		opp@860000000_900_2_4 {
+			opp-microvolt = <900000 900000 1250000>;
+		};
+
+		opp@860000000_900_3_4 {
+			opp-microvolt = <900000 900000 1250000>;
+		};
+
+		opp@860000000_900_2_7 {
+			opp-microvolt = <900000 900000 1250000>;
+		};
+
+		opp@860000000_900_3_7 {
+			opp-microvolt = <900000 900000 1250000>;
+		};
+
+		opp@860000000_900_4_7 {
+			opp-microvolt = <900000 900000 1250000>;
+		};
+
+		opp@860000000_900_2_8 {
+			opp-microvolt = <900000 900000 1250000>;
+		};
+
+		opp@860000000_900_3_8 {
+			opp-microvolt = <900000 900000 1250000>;
+		};
+
+		opp@860000000_900_4_8 {
+			opp-microvolt = <900000 900000 1250000>;
+		};
+
+		opp@860000000_975 {
+			opp-microvolt = <975000 975000 1250000>;
+		};
+
+		opp@860000000_975_1_1 {
+			opp-microvolt = <975000 975000 1250000>;
+		};
+
+		opp@860000000_975_1_2 {
+			opp-microvolt = <975000 975000 1250000>;
+		};
+
+		opp@860000000_975_1_3 {
+			opp-microvolt = <975000 975000 1250000>;
+		};
+
+		opp@860000000_975_1_4 {
+			opp-microvolt = <975000 975000 1250000>;
+		};
+
+		opp@860000000_975_1_7 {
+			opp-microvolt = <975000 975000 1250000>;
+		};
+
+		opp@860000000_975_1_8 {
+			opp-microvolt = <975000 975000 1250000>;
+		};
+
+		opp@860000000_1000 {
+			opp-microvolt = <1000000 1000000 1250000>;
+		};
+
+		opp@910000000_900 {
+			opp-microvolt = <900000 900000 1250000>;
+		};
+
+		opp@1000000000_900 {
+			opp-microvolt = <900000 900000 1250000>;
+		};
+
+		opp@1000000000_975 {
+			opp-microvolt = <975000 975000 1250000>;
+		};
+
+		opp@1000000000_975_2_1 {
+			opp-microvolt = <975000 975000 1250000>;
+		};
+
+		opp@1000000000_975_3_1 {
+			opp-microvolt = <975000 975000 1250000>;
+		};
+
+		opp@1000000000_975_2_2 {
+			opp-microvolt = <975000 975000 1250000>;
+		};
+
+		opp@1000000000_975_3_2 {
+			opp-microvolt = <975000 975000 1250000>;
+		};
+
+		opp@1000000000_975_2_3 {
+			opp-microvolt = <975000 975000 1250000>;
+		};
+
+		opp@1000000000_975_3_3 {
+			opp-microvolt = <975000 975000 1250000>;
+		};
+
+		opp@1000000000_975_2_4 {
+			opp-microvolt = <975000 975000 1250000>;
+		};
+
+		opp@1000000000_975_3_4 {
+			opp-microvolt = <975000 975000 1250000>;
+		};
+
+		opp@1000000000_975_2_7 {
+			opp-microvolt = <975000 975000 1250000>;
+		};
+
+		opp@1000000000_975_3_7 {
+			opp-microvolt = <975000 975000 1250000>;
+		};
+
+		opp@1000000000_975_4_7 {
+			opp-microvolt = <975000 975000 1250000>;
+		};
+
+		opp@1000000000_975_2_8 {
+			opp-microvolt = <975000 975000 1250000>;
+		};
+
+		opp@1000000000_975_3_8 {
+			opp-microvolt = <975000 975000 1250000>;
+		};
+
+		opp@1000000000_975_4_8 {
+			opp-microvolt = <975000 975000 1250000>;
+		};
+
+		opp@1000000000_1000 {
+			opp-microvolt = <1000000 1000000 1250000>;
+		};
+
+		opp@1000000000_1025 {
+			opp-microvolt = <1025000 1025000 1250000>;
+		};
+
+		opp@1100000000_900 {
+			opp-microvolt = <900000 900000 1250000>;
+		};
+
+		opp@1100000000_975 {
+			opp-microvolt = <975000 975000 1250000>;
+		};
+
+		opp@1100000000_975_3_1 {
+			opp-microvolt = <975000 975000 1250000>;
+		};
+
+		opp@1100000000_975_3_2 {
+			opp-microvolt = <975000 975000 1250000>;
+		};
+
+		opp@1100000000_975_3_3 {
+			opp-microvolt = <975000 975000 1250000>;
+		};
+
+		opp@1100000000_975_3_4 {
+			opp-microvolt = <975000 975000 1250000>;
+		};
+
+		opp@1100000000_975_3_7 {
+			opp-microvolt = <975000 975000 1250000>;
+		};
+
+		opp@1100000000_975_4_7 {
+			opp-microvolt = <975000 975000 1250000>;
+		};
+
+		opp@1100000000_975_3_8 {
+			opp-microvolt = <975000 975000 1250000>;
+		};
+
+		opp@1100000000_975_4_8 {
+			opp-microvolt = <975000 975000 1250000>;
+		};
+
+		opp@1100000000_1000 {
+			opp-microvolt = <1000000 1000000 1250000>;
+		};
+
+		opp@1100000000_1000_2_1 {
+			opp-microvolt = <1000000 1000000 1250000>;
+		};
+
+		opp@1100000000_1000_2_2 {
+			opp-microvolt = <1000000 1000000 1250000>;
+		};
+
+		opp@1100000000_1000_2_3 {
+			opp-microvolt = <1000000 1000000 1250000>;
+		};
+
+		opp@1100000000_1000_2_4 {
+			opp-microvolt = <1000000 1000000 1250000>;
+		};
+
+		opp@1100000000_1000_2_7 {
+			opp-microvolt = <1000000 1000000 1250000>;
+		};
+
+		opp@1100000000_1000_2_8 {
+			opp-microvolt = <1000000 1000000 1250000>;
+		};
+
+		opp@1100000000_1025 {
+			opp-microvolt = <1025000 1025000 1250000>;
+		};
+
+		opp@1100000000_1075 {
+			opp-microvolt = <1075000 1075000 1250000>;
+		};
+
+		opp@1150000000_975 {
+			opp-microvolt = <975000 975000 1250000>;
+		};
+
+		opp@1200000000_975 {
+			opp-microvolt = <975000 975000 1250000>;
+		};
+
+		opp@1200000000_1000 {
+			opp-microvolt = <1000000 1000000 1250000>;
+		};
+
+		opp@1200000000_1000_3_1 {
+			opp-microvolt = <1000000 1000000 1250000>;
+		};
+
+		opp@1200000000_1000_3_2 {
+			opp-microvolt = <1000000 1000000 1250000>;
+		};
+
+		opp@1200000000_1000_3_3 {
+			opp-microvolt = <1000000 1000000 1250000>;
+		};
+
+		opp@1200000000_1000_3_4 {
+			opp-microvolt = <1000000 1000000 1250000>;
+		};
+
+		opp@1200000000_1000_3_7 {
+			opp-microvolt = <1000000 1000000 1250000>;
+		};
+
+		opp@1200000000_1000_4_7 {
+			opp-microvolt = <1000000 1000000 1250000>;
+		};
+
+		opp@1200000000_1000_3_8 {
+			opp-microvolt = <1000000 1000000 1250000>;
+		};
+
+		opp@1200000000_1000_4_8 {
+			opp-microvolt = <1000000 1000000 1250000>;
+		};
+
+		opp@1200000000_1025 {
+			opp-microvolt = <1025000 1025000 1250000>;
+		};
+
+		opp@1200000000_1025_2_1 {
+			opp-microvolt = <1025000 1025000 1250000>;
+		};
+
+		opp@1200000000_1025_2_2 {
+			opp-microvolt = <1025000 1025000 1250000>;
+		};
+
+		opp@1200000000_1025_2_3 {
+			opp-microvolt = <1025000 1025000 1250000>;
+		};
+
+		opp@1200000000_1025_2_4 {
+			opp-microvolt = <1025000 1025000 1250000>;
+		};
+
+		opp@1200000000_1025_2_7 {
+			opp-microvolt = <1025000 1025000 1250000>;
+		};
+
+		opp@1200000000_1025_2_8 {
+			opp-microvolt = <1025000 1025000 1250000>;
+		};
+
+		opp@1200000000_1050 {
+			opp-microvolt = <1050000 1050000 1250000>;
+		};
+
+		opp@1200000000_1075 {
+			opp-microvolt = <1075000 1075000 1250000>;
+		};
+
+		opp@1200000000_1100 {
+			opp-microvolt = <1100000 1100000 1250000>;
+		};
+
+		opp@1300000000_1000 {
+			opp-microvolt = <1000000 1000000 1250000>;
+		};
+
+		opp@1300000000_1000_4_7 {
+			opp-microvolt = <1000000 1000000 1250000>;
+		};
+
+		opp@1300000000_1000_4_8 {
+			opp-microvolt = <1000000 1000000 1250000>;
+		};
+
+		opp@1300000000_1025 {
+			opp-microvolt = <1025000 1025000 1250000>;
+		};
+
+		opp@1300000000_1025_3_1 {
+			opp-microvolt = <1025000 1025000 1250000>;
+		};
+
+		opp@1300000000_1025_3_7 {
+			opp-microvolt = <1025000 1025000 1250000>;
+		};
+
+		opp@1300000000_1025_3_8 {
+			opp-microvolt = <1025000 1025000 1250000>;
+		};
+
+		opp@1300000000_1050 {
+			opp-microvolt = <1050000 1050000 1250000>;
+		};
+
+		opp@1300000000_1050_2_1 {
+			opp-microvolt = <1050000 1050000 1250000>;
+		};
+
+		opp@1300000000_1050_3_2 {
+			opp-microvolt = <1050000 1050000 1250000>;
+		};
+
+		opp@1300000000_1050_3_3 {
+			opp-microvolt = <1050000 1050000 1250000>;
+		};
+
+		opp@1300000000_1050_3_4 {
+			opp-microvolt = <1050000 1050000 1250000>;
+		};
+
+		opp@1300000000_1050_3_5 {
+			opp-microvolt = <1050000 1050000 1250000>;
+		};
+
+		opp@1300000000_1050_3_6 {
+			opp-microvolt = <1050000 1050000 1250000>;
+		};
+
+		opp@1300000000_1050_2_7 {
+			opp-microvolt = <1050000 1050000 1250000>;
+		};
+
+		opp@1300000000_1050_2_8 {
+			opp-microvolt = <1050000 1050000 1250000>;
+		};
+
+		opp@1300000000_1050_3_12 {
+			opp-microvolt = <1050000 1050000 1250000>;
+		};
+
+		opp@1300000000_1050_3_13 {
+			opp-microvolt = <1050000 1050000 1250000>;
+		};
+
+		opp@1300000000_1075 {
+			opp-microvolt = <1075000 1075000 1250000>;
+		};
+
+		opp@1300000000_1075_2_2 {
+			opp-microvolt = <1075000 1075000 1250000>;
+		};
+
+		opp@1300000000_1075_2_3 {
+			opp-microvolt = <1075000 1075000 1250000>;
+		};
+
+		opp@1300000000_1075_2_4 {
+			opp-microvolt = <1075000 1075000 1250000>;
+		};
+
+		opp@1300000000_1100 {
+			opp-microvolt = <1100000 1100000 1250000>;
+		};
+
+		opp@1300000000_1125 {
+			opp-microvolt = <1125000 1125000 1250000>;
+		};
+
+		opp@1300000000_1150 {
+			opp-microvolt = <1150000 1150000 1250000>;
+		};
+
+		opp@1300000000_1175 {
+			opp-microvolt = <1175000 1175000 1250000>;
+		};
+
+		opp@1400000000_1100 {
+			opp-microvolt = <1100000 1100000 1250000>;
+		};
+
+		opp@1400000000_1125 {
+			opp-microvolt = <1125000 1125000 1250000>;
+		};
+
+		opp@1400000000_1150 {
+			opp-microvolt = <1150000 1150000 1250000>;
+		};
+
+		opp@1400000000_1150_2_4 {
+			opp-microvolt = <1150000 1150000 1250000>;
+		};
+
+		opp@1400000000_1175 {
+			opp-microvolt = <1175000 1175000 1250000>;
+		};
+
+		opp@1400000000_1237 {
+			opp-microvolt = <1237000 1237000 1250000>;
+		};
+
+		opp@1500000000_1125 {
+			opp-microvolt = <1125000 1125000 1250000>;
+		};
+
+		opp@1500000000_1125_4_5 {
+			opp-microvolt = <1125000 1125000 1250000>;
+		};
+
+		opp@1500000000_1125_4_6 {
+			opp-microvolt = <1125000 1125000 1250000>;
+		};
+
+		opp@1500000000_1125_4_12 {
+			opp-microvolt = <1125000 1125000 1250000>;
+		};
+
+		opp@1500000000_1125_4_13 {
+			opp-microvolt = <1125000 1125000 1250000>;
+		};
+
+		opp@1500000000_1150 {
+			opp-microvolt = <1150000 1150000 1250000>;
+		};
+
+		opp@1500000000_1150_3_5 {
+			opp-microvolt = <1150000 1150000 1250000>;
+		};
+
+		opp@1500000000_1150_3_6 {
+			opp-microvolt = <1150000 1150000 1250000>;
+		};
+
+		opp@1500000000_1150_3_12 {
+			opp-microvolt = <1150000 1150000 1250000>;
+		};
+
+		opp@1500000000_1150_3_13 {
+			opp-microvolt = <1150000 1150000 1250000>;
+		};
+
+		opp@1500000000_1200 {
+			opp-microvolt = <1200000 1200000 1250000>;
+		};
+
+		opp@1500000000_1237 {
+			opp-microvolt = <1237000 1237000 1250000>;
+		};
+
+		opp@1600000000_1212 {
+			opp-microvolt = <1212000 1212000 1250000>;
+		};
+
+		opp@1600000000_1237 {
+			opp-microvolt = <1237000 1237000 1250000>;
+		};
+
+		opp@1700000000_1212 {
+			opp-microvolt = <1212000 1212000 1250000>;
+		};
+
+		opp@1700000000_1237 {
+			opp-microvolt = <1237000 1237000 1250000>;
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/tegra30-cpu-opp.dtsi b/arch/arm/boot/dts/tegra30-cpu-opp.dtsi
new file mode 100644
index 000000000000..d64fc262585e
--- /dev/null
+++ b/arch/arm/boot/dts/tegra30-cpu-opp.dtsi
@@ -0,0 +1,1202 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/ {
+	cpu0_opp_table: cpu_opp_table0 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp@51000000_800 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x1F 0x31FE>;
+			opp-hz = /bits/ 64 <51000000>;
+		};
+
+		opp@51000000_850 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x1F 0x0C01>;
+			opp-hz = /bits/ 64 <51000000>;
+		};
+
+		opp@51000000_912 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x1F 0x0200>;
+			opp-hz = /bits/ 64 <51000000>;
+		};
+
+		opp@102000000_800 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x1F 0x31FE>;
+			opp-hz = /bits/ 64 <102000000>;
+		};
+
+		opp@102000000_850 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x1F 0x0C01>;
+			opp-hz = /bits/ 64 <102000000>;
+		};
+
+		opp@102000000_912 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x1F 0x0200>;
+			opp-hz = /bits/ 64 <102000000>;
+		};
+
+		opp@204000000_800 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x1F 0x31FE>;
+			opp-hz = /bits/ 64 <204000000>;
+		};
+
+		opp@204000000_850 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x1F 0x0C01>;
+			opp-hz = /bits/ 64 <204000000>;
+		};
+
+		opp@204000000_912 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x1F 0x0200>;
+			opp-hz = /bits/ 64 <204000000>;
+		};
+
+		opp@312000000_850 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x1F 0x0C00>;
+			opp-hz = /bits/ 64 <312000000>;
+		};
+
+		opp@312000000_912 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x1F 0x0200>;
+			opp-hz = /bits/ 64 <312000000>;
+		};
+
+		opp@340000000_800 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x1F 0x0192>;
+			opp-hz = /bits/ 64 <340000000>;
+		};
+
+		opp@340000000_850 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x0F 0x0001>;
+			opp-hz = /bits/ 64 <340000000>;
+		};
+
+		opp@370000000_800 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x1E 0x306C>;
+			opp-hz = /bits/ 64 <370000000>;
+		};
+
+		opp@456000000_850 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x1F 0x0C00>;
+			opp-hz = /bits/ 64 <456000000>;
+		};
+
+		opp@456000000_912 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x1F 0x0200>;
+			opp-hz = /bits/ 64 <456000000>;
+		};
+
+		opp@475000000_800 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x1E 0x31FE>;
+			opp-hz = /bits/ 64 <475000000>;
+		};
+
+		opp@475000000_850 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x0F 0x0001>;
+			opp-hz = /bits/ 64 <475000000>;
+		};
+
+		opp@475000000_850_0_1 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x01 0x0002>;
+			opp-hz = /bits/ 64 <475000000>;
+		};
+
+		opp@475000000_850_0_4 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x01 0x0010>;
+			opp-hz = /bits/ 64 <475000000>;
+		};
+
+		opp@475000000_850_0_7 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x01 0x0080>;
+			opp-hz = /bits/ 64 <475000000>;
+		};
+
+		opp@475000000_850_0_8 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x01 0x0100>;
+			opp-hz = /bits/ 64 <475000000>;
+		};
+
+		opp@608000000_850 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x1F 0x0400>;
+			opp-hz = /bits/ 64 <608000000>;
+		};
+
+		opp@608000000_912 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x1F 0x0200>;
+			opp-hz = /bits/ 64 <608000000>;
+		};
+
+		opp@620000000_850 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x1E 0x306C>;
+			opp-hz = /bits/ 64 <620000000>;
+		};
+
+		opp@640000000_850 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x0F 0x0001>;
+			opp-hz = /bits/ 64 <640000000>;
+		};
+
+		opp@640000000_850_1_1 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x02 0x0002>;
+			opp-hz = /bits/ 64 <640000000>;
+		};
+
+		opp@640000000_850_2_1 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x04 0x0002>;
+			opp-hz = /bits/ 64 <640000000>;
+		};
+
+		opp@640000000_850_3_1 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x08 0x0002>;
+			opp-hz = /bits/ 64 <640000000>;
+		};
+
+		opp@640000000_850_1_4 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x02 0x0010>;
+			opp-hz = /bits/ 64 <640000000>;
+		};
+
+		opp@640000000_850_2_4 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x04 0x0010>;
+			opp-hz = /bits/ 64 <640000000>;
+		};
+
+		opp@640000000_850_3_4 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x08 0x0010>;
+			opp-hz = /bits/ 64 <640000000>;
+		};
+
+		opp@640000000_850_1_7 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x02 0x0080>;
+			opp-hz = /bits/ 64 <640000000>;
+		};
+
+		opp@640000000_850_2_7 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x04 0x0080>;
+			opp-hz = /bits/ 64 <640000000>;
+		};
+
+		opp@640000000_850_3_7 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x08 0x0080>;
+			opp-hz = /bits/ 64 <640000000>;
+		};
+
+		opp@640000000_850_4_7 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x10 0x0080>;
+			opp-hz = /bits/ 64 <640000000>;
+		};
+
+		opp@640000000_850_1_8 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x02 0x0100>;
+			opp-hz = /bits/ 64 <640000000>;
+		};
+
+		opp@640000000_850_2_8 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x04 0x0100>;
+			opp-hz = /bits/ 64 <640000000>;
+		};
+
+		opp@640000000_850_3_8 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x08 0x0100>;
+			opp-hz = /bits/ 64 <640000000>;
+		};
+
+		opp@640000000_850_4_8 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x10 0x0100>;
+			opp-hz = /bits/ 64 <640000000>;
+		};
+
+		opp@640000000_900 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x01 0x0192>;
+			opp-hz = /bits/ 64 <640000000>;
+		};
+
+		opp@760000000_850 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x1E 0x3461>;
+			opp-hz = /bits/ 64 <760000000>;
+		};
+
+		opp@760000000_850_3_1 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x08 0x0002>;
+			opp-hz = /bits/ 64 <760000000>;
+		};
+
+		opp@760000000_850_3_2 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x08 0x0004>;
+			opp-hz = /bits/ 64 <760000000>;
+		};
+
+		opp@760000000_850_3_3 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x08 0x0008>;
+			opp-hz = /bits/ 64 <760000000>;
+		};
+
+		opp@760000000_850_3_4 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x08 0x0010>;
+			opp-hz = /bits/ 64 <760000000>;
+		};
+
+		opp@760000000_850_3_7 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x08 0x0080>;
+			opp-hz = /bits/ 64 <760000000>;
+		};
+
+		opp@760000000_850_4_7 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x10 0x0080>;
+			opp-hz = /bits/ 64 <760000000>;
+		};
+
+		opp@760000000_850_3_8 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x08 0x0100>;
+			opp-hz = /bits/ 64 <760000000>;
+		};
+
+		opp@760000000_850_4_8 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x10 0x0100>;
+			opp-hz = /bits/ 64 <760000000>;
+		};
+
+		opp@760000000_850_0_10 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x01 0x0400>;
+			opp-hz = /bits/ 64 <760000000>;
+		};
+
+		opp@760000000_900 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x01 0x0001>;
+			opp-hz = /bits/ 64 <760000000>;
+		};
+
+		opp@760000000_900_1_1 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x02 0x0002>;
+			opp-hz = /bits/ 64 <760000000>;
+		};
+
+		opp@760000000_900_2_1 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x04 0x0002>;
+			opp-hz = /bits/ 64 <760000000>;
+		};
+
+		opp@760000000_900_1_2 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x02 0x0004>;
+			opp-hz = /bits/ 64 <760000000>;
+		};
+
+		opp@760000000_900_2_2 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x04 0x0004>;
+			opp-hz = /bits/ 64 <760000000>;
+		};
+
+		opp@760000000_900_1_3 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x02 0x0008>;
+			opp-hz = /bits/ 64 <760000000>;
+		};
+
+		opp@760000000_900_2_3 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x04 0x0008>;
+			opp-hz = /bits/ 64 <760000000>;
+		};
+
+		opp@760000000_900_1_4 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x02 0x0010>;
+			opp-hz = /bits/ 64 <760000000>;
+		};
+
+		opp@760000000_900_2_4 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x04 0x0010>;
+			opp-hz = /bits/ 64 <760000000>;
+		};
+
+		opp@760000000_900_1_7 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x02 0x0080>;
+			opp-hz = /bits/ 64 <760000000>;
+		};
+
+		opp@760000000_900_2_7 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x04 0x0080>;
+			opp-hz = /bits/ 64 <760000000>;
+		};
+
+		opp@760000000_900_1_8 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x02 0x0100>;
+			opp-hz = /bits/ 64 <760000000>;
+		};
+
+		opp@760000000_900_2_8 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x04 0x0100>;
+			opp-hz = /bits/ 64 <760000000>;
+		};
+
+		opp@760000000_912 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x1F 0x0200>;
+			opp-hz = /bits/ 64 <760000000>;
+		};
+
+		opp@760000000_975 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x01 0x0192>;
+			opp-hz = /bits/ 64 <760000000>;
+		};
+
+		opp@816000000_850 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x1F 0x0400>;
+			opp-hz = /bits/ 64 <816000000>;
+		};
+
+		opp@816000000_912 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x1F 0x0200>;
+			opp-hz = /bits/ 64 <816000000>;
+		};
+
+		opp@860000000_850 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x0C 0x0001>;
+			opp-hz = /bits/ 64 <860000000>;
+		};
+
+		opp@860000000_900 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x02 0x0001>;
+			opp-hz = /bits/ 64 <860000000>;
+		};
+
+		opp@860000000_900_2_1 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x04 0x0002>;
+			opp-hz = /bits/ 64 <860000000>;
+		};
+
+		opp@860000000_900_3_1 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x08 0x0002>;
+			opp-hz = /bits/ 64 <860000000>;
+		};
+
+		opp@860000000_900_2_2 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x04 0x0004>;
+			opp-hz = /bits/ 64 <860000000>;
+		};
+
+		opp@860000000_900_3_2 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x08 0x0004>;
+			opp-hz = /bits/ 64 <860000000>;
+		};
+
+		opp@860000000_900_2_3 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x04 0x0008>;
+			opp-hz = /bits/ 64 <860000000>;
+		};
+
+		opp@860000000_900_3_3 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x08 0x0008>;
+			opp-hz = /bits/ 64 <860000000>;
+		};
+
+		opp@860000000_900_2_4 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x04 0x0010>;
+			opp-hz = /bits/ 64 <860000000>;
+		};
+
+		opp@860000000_900_3_4 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x08 0x0010>;
+			opp-hz = /bits/ 64 <860000000>;
+		};
+
+		opp@860000000_900_2_7 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x04 0x0080>;
+			opp-hz = /bits/ 64 <860000000>;
+		};
+
+		opp@860000000_900_3_7 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x08 0x0080>;
+			opp-hz = /bits/ 64 <860000000>;
+		};
+
+		opp@860000000_900_4_7 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x10 0x0080>;
+			opp-hz = /bits/ 64 <860000000>;
+		};
+
+		opp@860000000_900_2_8 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x04 0x0100>;
+			opp-hz = /bits/ 64 <860000000>;
+		};
+
+		opp@860000000_900_3_8 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x08 0x0100>;
+			opp-hz = /bits/ 64 <860000000>;
+		};
+
+		opp@860000000_900_4_8 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x10 0x0100>;
+			opp-hz = /bits/ 64 <860000000>;
+		};
+
+		opp@860000000_975 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x01 0x0001>;
+			opp-hz = /bits/ 64 <860000000>;
+		};
+
+		opp@860000000_975_1_1 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x02 0x0002>;
+			opp-hz = /bits/ 64 <860000000>;
+		};
+
+		opp@860000000_975_1_2 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x02 0x0004>;
+			opp-hz = /bits/ 64 <860000000>;
+		};
+
+		opp@860000000_975_1_3 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x02 0x0008>;
+			opp-hz = /bits/ 64 <860000000>;
+		};
+
+		opp@860000000_975_1_4 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x02 0x0010>;
+			opp-hz = /bits/ 64 <860000000>;
+		};
+
+		opp@860000000_975_1_7 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x02 0x0080>;
+			opp-hz = /bits/ 64 <860000000>;
+		};
+
+		opp@860000000_975_1_8 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x02 0x0100>;
+			opp-hz = /bits/ 64 <860000000>;
+		};
+
+		opp@860000000_1000 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x01 0x0192>;
+			opp-hz = /bits/ 64 <860000000>;
+		};
+
+		opp@910000000_900 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x18 0x3060>;
+			opp-hz = /bits/ 64 <910000000>;
+		};
+
+		opp@1000000000_900 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x0C 0x0001>;
+			opp-hz = /bits/ 64 <1000000000>;
+		};
+
+		opp@1000000000_975 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x03 0x0001>;
+			opp-hz = /bits/ 64 <1000000000>;
+		};
+
+		opp@1000000000_975_2_1 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x04 0x0002>;
+			opp-hz = /bits/ 64 <1000000000>;
+		};
+
+		opp@1000000000_975_3_1 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x08 0x0002>;
+			opp-hz = /bits/ 64 <1000000000>;
+		};
+
+		opp@1000000000_975_2_2 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x04 0x0004>;
+			opp-hz = /bits/ 64 <1000000000>;
+		};
+
+		opp@1000000000_975_3_2 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x08 0x0004>;
+			opp-hz = /bits/ 64 <1000000000>;
+		};
+
+		opp@1000000000_975_2_3 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x04 0x0008>;
+			opp-hz = /bits/ 64 <1000000000>;
+		};
+
+		opp@1000000000_975_3_3 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x08 0x0008>;
+			opp-hz = /bits/ 64 <1000000000>;
+		};
+
+		opp@1000000000_975_2_4 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x04 0x0010>;
+			opp-hz = /bits/ 64 <1000000000>;
+		};
+
+		opp@1000000000_975_3_4 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x08 0x0010>;
+			opp-hz = /bits/ 64 <1000000000>;
+		};
+
+		opp@1000000000_975_2_7 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x04 0x0080>;
+			opp-hz = /bits/ 64 <1000000000>;
+		};
+
+		opp@1000000000_975_3_7 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x08 0x0080>;
+			opp-hz = /bits/ 64 <1000000000>;
+		};
+
+		opp@1000000000_975_4_7 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x10 0x0080>;
+			opp-hz = /bits/ 64 <1000000000>;
+		};
+
+		opp@1000000000_975_2_8 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x04 0x0100>;
+			opp-hz = /bits/ 64 <1000000000>;
+		};
+
+		opp@1000000000_975_3_8 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x08 0x0100>;
+			opp-hz = /bits/ 64 <1000000000>;
+		};
+
+		opp@1000000000_975_4_8 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x10 0x0100>;
+			opp-hz = /bits/ 64 <1000000000>;
+		};
+
+		opp@1000000000_1000 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x02 0x019E>;
+			opp-hz = /bits/ 64 <1000000000>;
+		};
+
+		opp@1000000000_1025 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x01 0x0192>;
+			opp-hz = /bits/ 64 <1000000000>;
+		};
+
+		opp@1100000000_900 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x08 0x0001>;
+			opp-hz = /bits/ 64 <1100000000>;
+		};
+
+		opp@1100000000_975 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x06 0x0001>;
+			opp-hz = /bits/ 64 <1100000000>;
+		};
+
+		opp@1100000000_975_3_1 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x08 0x0002>;
+			opp-hz = /bits/ 64 <1100000000>;
+		};
+
+		opp@1100000000_975_3_2 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x08 0x0004>;
+			opp-hz = /bits/ 64 <1100000000>;
+		};
+
+		opp@1100000000_975_3_3 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x08 0x0008>;
+			opp-hz = /bits/ 64 <1100000000>;
+		};
+
+		opp@1100000000_975_3_4 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x08 0x0010>;
+			opp-hz = /bits/ 64 <1100000000>;
+		};
+
+		opp@1100000000_975_3_7 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x08 0x0080>;
+			opp-hz = /bits/ 64 <1100000000>;
+		};
+
+		opp@1100000000_975_4_7 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x10 0x0080>;
+			opp-hz = /bits/ 64 <1100000000>;
+		};
+
+		opp@1100000000_975_3_8 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x08 0x0100>;
+			opp-hz = /bits/ 64 <1100000000>;
+		};
+
+		opp@1100000000_975_4_8 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x10 0x0100>;
+			opp-hz = /bits/ 64 <1100000000>;
+		};
+
+		opp@1100000000_1000 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x01 0x0001>;
+			opp-hz = /bits/ 64 <1100000000>;
+		};
+
+		opp@1100000000_1000_2_1 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x04 0x0002>;
+			opp-hz = /bits/ 64 <1100000000>;
+		};
+
+		opp@1100000000_1000_2_2 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x04 0x0004>;
+			opp-hz = /bits/ 64 <1100000000>;
+		};
+
+		opp@1100000000_1000_2_3 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x04 0x0008>;
+			opp-hz = /bits/ 64 <1100000000>;
+		};
+
+		opp@1100000000_1000_2_4 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x04 0x0010>;
+			opp-hz = /bits/ 64 <1100000000>;
+		};
+
+		opp@1100000000_1000_2_7 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x04 0x0080>;
+			opp-hz = /bits/ 64 <1100000000>;
+		};
+
+		opp@1100000000_1000_2_8 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x04 0x0100>;
+			opp-hz = /bits/ 64 <1100000000>;
+		};
+
+		opp@1100000000_1025 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x02 0x019E>;
+			opp-hz = /bits/ 64 <1100000000>;
+		};
+
+		opp@1100000000_1075 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x01 0x0192>;
+			opp-hz = /bits/ 64 <1100000000>;
+		};
+
+		opp@1150000000_975 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x18 0x3060>;
+			opp-hz = /bits/ 64 <1150000000>;
+		};
+
+		opp@1200000000_975 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x08 0x0001>;
+			opp-hz = /bits/ 64 <1200000000>;
+		};
+
+		opp@1200000000_1000 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x04 0x0001>;
+			opp-hz = /bits/ 64 <1200000000>;
+		};
+
+		opp@1200000000_1000_3_1 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x08 0x0002>;
+			opp-hz = /bits/ 64 <1200000000>;
+		};
+
+		opp@1200000000_1000_3_2 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x08 0x0004>;
+			opp-hz = /bits/ 64 <1200000000>;
+		};
+
+		opp@1200000000_1000_3_3 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x08 0x0008>;
+			opp-hz = /bits/ 64 <1200000000>;
+		};
+
+		opp@1200000000_1000_3_4 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x08 0x0010>;
+			opp-hz = /bits/ 64 <1200000000>;
+		};
+
+		opp@1200000000_1000_3_7 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x08 0x0080>;
+			opp-hz = /bits/ 64 <1200000000>;
+		};
+
+		opp@1200000000_1000_4_7 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x10 0x0080>;
+			opp-hz = /bits/ 64 <1200000000>;
+		};
+
+		opp@1200000000_1000_3_8 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x08 0x0100>;
+			opp-hz = /bits/ 64 <1200000000>;
+		};
+
+		opp@1200000000_1000_4_8 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x10 0x0100>;
+			opp-hz = /bits/ 64 <1200000000>;
+		};
+
+		opp@1200000000_1025 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x02 0x0001>;
+			opp-hz = /bits/ 64 <1200000000>;
+		};
+
+		opp@1200000000_1025_2_1 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x04 0x0002>;
+			opp-hz = /bits/ 64 <1200000000>;
+		};
+
+		opp@1200000000_1025_2_2 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x04 0x0004>;
+			opp-hz = /bits/ 64 <1200000000>;
+		};
+
+		opp@1200000000_1025_2_3 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x04 0x0008>;
+			opp-hz = /bits/ 64 <1200000000>;
+		};
+
+		opp@1200000000_1025_2_4 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x04 0x0010>;
+			opp-hz = /bits/ 64 <1200000000>;
+		};
+
+		opp@1200000000_1025_2_7 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x04 0x0080>;
+			opp-hz = /bits/ 64 <1200000000>;
+		};
+
+		opp@1200000000_1025_2_8 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x04 0x0100>;
+			opp-hz = /bits/ 64 <1200000000>;
+		};
+
+		opp@1200000000_1050 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x02 0x019E>;
+			opp-hz = /bits/ 64 <1200000000>;
+		};
+
+		opp@1200000000_1075 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x01 0x0001>;
+			opp-hz = /bits/ 64 <1200000000>;
+		};
+
+		opp@1200000000_1100 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x01 0x0192>;
+			opp-hz = /bits/ 64 <1200000000>;
+		};
+
+		opp@1300000000_1000 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x08 0x0001>;
+			opp-hz = /bits/ 64 <1300000000>;
+		};
+
+		opp@1300000000_1000_4_7 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x10 0x0080>;
+			opp-hz = /bits/ 64 <1300000000>;
+		};
+
+		opp@1300000000_1000_4_8 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x10 0x0100>;
+			opp-hz = /bits/ 64 <1300000000>;
+		};
+
+		opp@1300000000_1025 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x04 0x0001>;
+			opp-hz = /bits/ 64 <1300000000>;
+		};
+
+		opp@1300000000_1025_3_1 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x08 0x0002>;
+			opp-hz = /bits/ 64 <1300000000>;
+		};
+
+		opp@1300000000_1025_3_7 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x08 0x0080>;
+			opp-hz = /bits/ 64 <1300000000>;
+		};
+
+		opp@1300000000_1025_3_8 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x08 0x0100>;
+			opp-hz = /bits/ 64 <1300000000>;
+		};
+
+		opp@1300000000_1050 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x12 0x3061>;
+			opp-hz = /bits/ 64 <1300000000>;
+		};
+
+		opp@1300000000_1050_2_1 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x04 0x0002>;
+			opp-hz = /bits/ 64 <1300000000>;
+		};
+
+		opp@1300000000_1050_3_2 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x08 0x0004>;
+			opp-hz = /bits/ 64 <1300000000>;
+		};
+
+		opp@1300000000_1050_3_3 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x08 0x0008>;
+			opp-hz = /bits/ 64 <1300000000>;
+		};
+
+		opp@1300000000_1050_3_4 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x08 0x0010>;
+			opp-hz = /bits/ 64 <1300000000>;
+		};
+
+		opp@1300000000_1050_3_5 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x08 0x0020>;
+			opp-hz = /bits/ 64 <1300000000>;
+		};
+
+		opp@1300000000_1050_3_6 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x08 0x0040>;
+			opp-hz = /bits/ 64 <1300000000>;
+		};
+
+		opp@1300000000_1050_2_7 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x04 0x0080>;
+			opp-hz = /bits/ 64 <1300000000>;
+		};
+
+		opp@1300000000_1050_2_8 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x04 0x0100>;
+			opp-hz = /bits/ 64 <1300000000>;
+		};
+
+		opp@1300000000_1050_3_12 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x08 0x1000>;
+			opp-hz = /bits/ 64 <1300000000>;
+		};
+
+		opp@1300000000_1050_3_13 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x08 0x2000>;
+			opp-hz = /bits/ 64 <1300000000>;
+		};
+
+		opp@1300000000_1075 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x02 0x0182>;
+			opp-hz = /bits/ 64 <1300000000>;
+		};
+
+		opp@1300000000_1075_2_2 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x04 0x0004>;
+			opp-hz = /bits/ 64 <1300000000>;
+		};
+
+		opp@1300000000_1075_2_3 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x04 0x0008>;
+			opp-hz = /bits/ 64 <1300000000>;
+		};
+
+		opp@1300000000_1075_2_4 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x04 0x0010>;
+			opp-hz = /bits/ 64 <1300000000>;
+		};
+
+		opp@1300000000_1100 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x02 0x001C>;
+			opp-hz = /bits/ 64 <1300000000>;
+		};
+
+		opp@1300000000_1125 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x01 0x0001>;
+			opp-hz = /bits/ 64 <1300000000>;
+		};
+
+		opp@1300000000_1150 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x01 0x0182>;
+			opp-hz = /bits/ 64 <1300000000>;
+		};
+
+		opp@1300000000_1175 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x01 0x0010>;
+			opp-hz = /bits/ 64 <1300000000>;
+		};
+
+		opp@1400000000_1100 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x18 0x307C>;
+			opp-hz = /bits/ 64 <1400000000>;
+		};
+
+		opp@1400000000_1125 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x04 0x000C>;
+			opp-hz = /bits/ 64 <1400000000>;
+		};
+
+		opp@1400000000_1150 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x02 0x000C>;
+			opp-hz = /bits/ 64 <1400000000>;
+		};
+
+		opp@1400000000_1150_2_4 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x04 0x0010>;
+			opp-hz = /bits/ 64 <1400000000>;
+		};
+
+		opp@1400000000_1175 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x02 0x0010>;
+			opp-hz = /bits/ 64 <1400000000>;
+		};
+
+		opp@1400000000_1237 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x01 0x0010>;
+			opp-hz = /bits/ 64 <1400000000>;
+		};
+
+		opp@1500000000_1125 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x08 0x0010>;
+			opp-hz = /bits/ 64 <1500000000>;
+		};
+
+		opp@1500000000_1125_4_5 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x10 0x0020>;
+			opp-hz = /bits/ 64 <1500000000>;
+		};
+
+		opp@1500000000_1125_4_6 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x10 0x0040>;
+			opp-hz = /bits/ 64 <1500000000>;
+		};
+
+		opp@1500000000_1125_4_12 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x10 0x1000>;
+			opp-hz = /bits/ 64 <1500000000>;
+		};
+
+		opp@1500000000_1125_4_13 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x10 0x2000>;
+			opp-hz = /bits/ 64 <1500000000>;
+		};
+
+		opp@1500000000_1150 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x04 0x0010>;
+			opp-hz = /bits/ 64 <1500000000>;
+		};
+
+		opp@1500000000_1150_3_5 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x08 0x0020>;
+			opp-hz = /bits/ 64 <1500000000>;
+		};
+
+		opp@1500000000_1150_3_6 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x08 0x0040>;
+			opp-hz = /bits/ 64 <1500000000>;
+		};
+
+		opp@1500000000_1150_3_12 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x08 0x1000>;
+			opp-hz = /bits/ 64 <1500000000>;
+		};
+
+		opp@1500000000_1150_3_13 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x08 0x2000>;
+			opp-hz = /bits/ 64 <1500000000>;
+		};
+
+		opp@1500000000_1200 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x02 0x0010>;
+			opp-hz = /bits/ 64 <1500000000>;
+		};
+
+		opp@1500000000_1237 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x01 0x0010>;
+			opp-hz = /bits/ 64 <1500000000>;
+		};
+
+		opp@1600000000_1212 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x10 0x3060>;
+			opp-hz = /bits/ 64 <1600000000>;
+		};
+
+		opp@1600000000_1237 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x08 0x3060>;
+			opp-hz = /bits/ 64 <1600000000>;
+		};
+
+		opp@1700000000_1212 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x10 0x3060>;
+			opp-hz = /bits/ 64 <1700000000>;
+		};
+
+		opp@1700000000_1237 {
+			clock-latency-ns = <100000>;
+			opp-supported-hw = <0x08 0x3060>;
+			opp-hz = /bits/ 64 <1700000000>;
+		};
+	};
+};
-- 
2.23.0
