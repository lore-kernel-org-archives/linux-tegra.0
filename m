From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v2 15/17] ARM: dts: tegra20: trimslice: Add CPU Operating Performance Points
Date: Fri, 25 Oct 2019 01:14:14 +0300
Message-ID: <20191024221416.14197-16-digetx@gmail.com>
References: <20191024221416.14197-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191024221416.14197-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Peter Geis <pgwipeout@gmail.com>, Nicolas Chauvet <kwizart@gmail.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Utilize common Tegra20 CPU OPP table. CPU voltage scaling is available now
on TrimSlice.

Tested-by: Nicolas Chauvet <kwizart@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20-trimslice.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/tegra20-trimslice.dts b/arch/arm/boot/dts/tegra20-trimslice.dts
index 3e5ac096d85e..8debd3d3c20d 100644
--- a/arch/arm/boot/dts/tegra20-trimslice.dts
+++ b/arch/arm/boot/dts/tegra20-trimslice.dts
@@ -3,6 +3,7 @@
 
 #include <dt-bindings/input/input.h>
 #include "tegra20.dtsi"
+#include "tegra20-cpu-opp.dtsi"
 
 / {
 	model = "Compulab TrimSlice board";
@@ -471,4 +472,14 @@
 			 <&tegra_car TEGRA20_CLK_CDEV1>;
 		clock-names = "pll_a", "pll_a_out0", "mclk";
 	};
+
+	cpus {
+		cpu0: cpu@0 {
+			operating-points-v2 = <&cpu0_opp_table>;
+		};
+
+		cpu@1 {
+			operating-points-v2 = <&cpu0_opp_table>;
+		};
+	};
 };
-- 
2.23.0
