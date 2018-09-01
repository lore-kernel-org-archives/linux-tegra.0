From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2 05/34] ARM: tegra: colibri_t30: annotate uarts and move compatible to board
Date: Sat,  1 Sep 2018 10:12:19 +0200
Message-ID: <20180901081248.22639-6-marcel@ziswiler.com>
References: <20180901081248.22639-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180901081248.22639-1-marcel@ziswiler.com>
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

 arch/arm/boot/dts/tegra30-colibri-eval-v3.dts | 5 +++--
 arch/arm/boot/dts/tegra30-colibri.dtsi        | 8 ++++++++
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts b/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts
index 1c057b285153..682ea4ffce83 100644
--- a/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts
+++ b/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts
@@ -33,17 +33,18 @@
 		};
 	};
 
+	/* Colibri UART-A */
 	serial@70006000 {
 		status = "okay";
 	};
 
+	/* Colibri UART-C */
 	serial@70006040 {
-		compatible = "nvidia,tegra30-hsuart";
 		status = "okay";
 	};
 
+	/* Colibri UART-B */
 	serial@70006300 {
-		compatible = "nvidia,tegra30-hsuart";
 		status = "okay";
 	};
 
diff --git a/arch/arm/boot/dts/tegra30-colibri.dtsi b/arch/arm/boot/dts/tegra30-colibri.dtsi
index dc54eb734f64..a9b9db0a87f8 100644
--- a/arch/arm/boot/dts/tegra30-colibri.dtsi
+++ b/arch/arm/boot/dts/tegra30-colibri.dtsi
@@ -213,6 +213,14 @@
 		};
 	};
 
+	serial@70006040 {
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
