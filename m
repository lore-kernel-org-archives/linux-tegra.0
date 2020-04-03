From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v3 3/7] arm64: tegra: Order nodes by unit-address on Tegra194
Date: Fri,  3 Apr 2020 22:22:05 +0200
Message-ID: <20200403202209.299823-4-thierry.reding@gmail.com>
References: <20200403202209.299823-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200403202209.299823-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Thierry Reding <thierry.reding@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Dmitry Osipenko <digetx@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The pin controller device tree node was accidentally added in the wrong
place. Move it to the correct location to keep nodes ordered by unit-
address.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 64 ++++++++++++------------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index f4ede86e32b4..019f66f03a97 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -45,6 +45,38 @@ gpio: gpio@2200000 {
 			gpio-controller;
 		};
 
+		pinmux: pinmux@2430000 {
+			compatible = "nvidia,tegra194-pinmux";
+			reg = <0x2430000 0x17000
+			       0xc300000 0x4000>;
+
+			status = "okay";
+
+			pex_rst_c5_out_state: pex_rst_c5_out {
+				pex_rst {
+					nvidia,pins = "pex_l5_rst_n_pgg1";
+					nvidia,schmitt = <TEGRA_PIN_DISABLE>;
+					nvidia,lpdr = <TEGRA_PIN_ENABLE>;
+					nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+					nvidia,io-high-voltage = <TEGRA_PIN_ENABLE>;
+					nvidia,tristate = <TEGRA_PIN_DISABLE>;
+					nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				};
+			};
+
+			clkreq_c5_bi_dir_state: clkreq_c5_bi_dir {
+				clkreq {
+					nvidia,pins = "pex_l5_clkreq_n_pgg0";
+					nvidia,schmitt = <TEGRA_PIN_DISABLE>;
+					nvidia,lpdr = <TEGRA_PIN_ENABLE>;
+					nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+					nvidia,io-high-voltage = <TEGRA_PIN_ENABLE>;
+					nvidia,tristate = <TEGRA_PIN_DISABLE>;
+					nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				};
+			};
+		};
+
 		ethernet@2490000 {
 			compatible = "nvidia,tegra194-eqos",
 				     "nvidia,tegra186-eqos",
@@ -139,38 +171,6 @@ agic: interrupt-controller@2a40000 {
 			};
 		};
 
-		pinmux: pinmux@2430000 {
-			compatible = "nvidia,tegra194-pinmux";
-			reg = <0x2430000 0x17000
-			       0xc300000 0x4000>;
-
-			status = "okay";
-
-			pex_rst_c5_out_state: pex_rst_c5_out {
-				pex_rst {
-					nvidia,pins = "pex_l5_rst_n_pgg1";
-					nvidia,schmitt = <TEGRA_PIN_DISABLE>;
-					nvidia,lpdr = <TEGRA_PIN_ENABLE>;
-					nvidia,enable-input = <TEGRA_PIN_DISABLE>;
-					nvidia,io-high-voltage = <TEGRA_PIN_ENABLE>;
-					nvidia,tristate = <TEGRA_PIN_DISABLE>;
-					nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				};
-			};
-
-			clkreq_c5_bi_dir_state: clkreq_c5_bi_dir {
-				clkreq {
-					nvidia,pins = "pex_l5_clkreq_n_pgg0";
-					nvidia,schmitt = <TEGRA_PIN_DISABLE>;
-					nvidia,lpdr = <TEGRA_PIN_ENABLE>;
-					nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-					nvidia,io-high-voltage = <TEGRA_PIN_ENABLE>;
-					nvidia,tristate = <TEGRA_PIN_DISABLE>;
-					nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				};
-			};
-		};
-
 		mc: memory-controller@2c00000 {
 			compatible = "nvidia,tegra194-mc";
 			reg = <0x02c00000 0x100000>,
-- 
2.24.1
