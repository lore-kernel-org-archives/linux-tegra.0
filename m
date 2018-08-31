From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2 09/34] ARM: tegra: apalis_t30: annotate uarts and move compatible to board
Date: Fri, 31 Aug 2018 18:37:51 +0200
Message-ID: <20180831163817.23970-10-marcel@ziswiler.com>
References: <20180831163817.23970-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180831163817.23970-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Annotate UARTs and move the serial UART "nvidia,tegra30-hsuart"
compatible definitions from the carrier board to the module level device
trees. One could still override this in a custom carrier board device
tree if required.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes in v2:
- Also move serial UART "nvidia,tegra30-hsuart" compatible to module
  level device trees.

 arch/arm/boot/dts/tegra30-apalis-eval.dts |  7 ++++---
 arch/arm/boot/dts/tegra30-apalis.dtsi     | 12 ++++++++++++
 2 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30-apalis-eval.dts b/arch/arm/boot/dts/tegra30-apalis-eval.dts
index 14a62b5111ec..cd4e45759ac8 100644
--- a/arch/arm/boot/dts/tegra30-apalis-eval.dts
+++ b/arch/arm/boot/dts/tegra30-apalis-eval.dts
@@ -45,22 +45,23 @@
 		};
 	};
 
+	/* Apalis UART1 */
 	serial@70006000 {
 		status = "okay";
 	};
 
+	/* Apalis UART2 */
 	serial@70006040 {
-		compatible = "nvidia,tegra30-hsuart";
 		status = "okay";
 	};
 
+	/* Apalis UART3 */
 	serial@70006200 {
-		compatible = "nvidia,tegra30-hsuart";
 		status = "okay";
 	};
 
+	/* Apalis UART4 */
 	serial@70006300 {
-		compatible = "nvidia,tegra30-hsuart";
 		status = "okay";
 	};
 
diff --git a/arch/arm/boot/dts/tegra30-apalis.dtsi b/arch/arm/boot/dts/tegra30-apalis.dtsi
index 3b2e15519e4b..7e9d1b022982 100644
--- a/arch/arm/boot/dts/tegra30-apalis.dtsi
+++ b/arch/arm/boot/dts/tegra30-apalis.dtsi
@@ -449,6 +449,18 @@
 		};
 	};
 
+	serial@70006040 {
+		compatible = "nvidia,tegra30-hsuart";
+	};
+
+	serial@70006200 {
+		compatible = "nvidia,tegra30-hsuart";
+	};
+
+	serial@70006300 {
+		compatible = "nvidia,tegra30-hsuart";
+	};
+
 	hdmiddc: i2c@7000c700 {
 		clock-frequency = <10000>;
 	};
-- 
2.14.4
