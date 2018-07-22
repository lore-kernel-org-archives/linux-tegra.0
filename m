From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH 10/28] ARM: tegra: apalis_t30: annotate uarts
Date: Sun, 22 Jul 2018 18:49:18 +0200
Message-ID: <20180722164936.20581-11-marcel@ziswiler.com>
References: <20180722164936.20581-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180722164936.20581-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Annotate UARTs.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

 arch/arm/boot/dts/tegra30-apalis-eval.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/tegra30-apalis-eval.dts b/arch/arm/boot/dts/tegra30-apalis-eval.dts
index 05f3656c058c..37c7db35ab1f 100644
--- a/arch/arm/boot/dts/tegra30-apalis-eval.dts
+++ b/arch/arm/boot/dts/tegra30-apalis-eval.dts
@@ -51,20 +51,24 @@
 		};
 	};
 
+	/* Apalis UART1 */
 	serial@70006000 {
 		status = "okay";
 	};
 
+	/* Apalis UART2 */
 	serial@70006040 {
 		compatible = "nvidia,tegra30-hsuart";
 		status = "okay";
 	};
 
+	/* Apalis UART3 */
 	serial@70006200 {
 		compatible = "nvidia,tegra30-hsuart";
 		status = "okay";
 	};
 
+	/* Apalis UART4 */
 	serial@70006300 {
 		compatible = "nvidia,tegra30-hsuart";
 		status = "okay";
-- 
2.14.4
