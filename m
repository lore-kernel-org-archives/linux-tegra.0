From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v2 16/17] ARM: dts: tegra30: cardhu-a04: Set up voltage regulators for DVFS
Date: Fri, 25 Oct 2019 01:14:15 +0300
Message-ID: <20191024221416.14197-17-digetx@gmail.com>
References: <20191024221416.14197-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191024221416.14197-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Peter Geis <pgwipeout@gmail.com>, Nicolas Chauvet <kwizart@gmail.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Set min/max voltage and couple CPU/CORE regulators.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra30-cardhu-a04.dts | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/tegra30-cardhu-a04.dts b/arch/arm/boot/dts/tegra30-cardhu-a04.dts
index 4dbd4af679f0..0d71925d4f0b 100644
--- a/arch/arm/boot/dts/tegra30-cardhu-a04.dts
+++ b/arch/arm/boot/dts/tegra30-cardhu-a04.dts
@@ -103,4 +103,28 @@
 			gpio = <&gpio TEGRA_GPIO(DD, 0) GPIO_ACTIVE_HIGH>;
 		};
 	};
+
+	i2c@7000d000 {
+		pmic: tps65911@2d {
+			regulators {
+				vddctrl_reg: vddctrl {
+					regulator-min-microvolt = <800000>;
+					regulator-max-microvolt = <1125000>;
+					regulator-coupled-with = <&vddcore_reg>;
+					regulator-coupled-max-spread = <300000>;
+					regulator-max-step-microvolt = <100000>;
+
+					nvidia,tegra-cpu-regulator;
+				};
+			};
+		};
+
+		vddcore_reg: tps62361@60 {
+			regulator-coupled-with = <&vddctrl_reg>;
+			regulator-coupled-max-spread = <300000>;
+			regulator-max-step-microvolt = <100000>;
+
+			nvidia,tegra-core-regulator;
+		};
+	};
 };
-- 
2.23.0
