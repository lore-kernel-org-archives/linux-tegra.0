From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org>
Subject: [PATCH RFC 4/5] ARM: dts: tegra: use IRQ_TYPE_* to specify irq flags
Date: Fri, 26 May 2017 20:06:08 +0200
Message-ID: <20170526180609.2699-4-uwe@kleine-koenig.org>
References: <20170526180609.2699-1-uwe@kleine-koenig.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170526180609.2699-1-uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

According to the binding documentation and the source code the
tegra gpio controller takes IRQ_TYPE_* as its flags values, not
GPIO_ACTIVE_*.

This patch uses the right variable type which yields the same result
when compiled. Note that this might be wrong and actually
IRQ_TYPE_LEVEL_LOW is intended by the dt author.

Signed-off-by: Uwe Kleine-König <uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org>
---
 arch/arm/boot/dts/tegra114-dalmore.dts        | 2 +-
 arch/arm/boot/dts/tegra124-jetson-tk1.dts     | 2 +-
 arch/arm/boot/dts/tegra124-venice2.dts        | 2 +-
 arch/arm/boot/dts/tegra30-apalis.dtsi         | 4 ++--
 arch/arm/boot/dts/tegra30-beaver.dts          | 2 +-
 arch/arm/boot/dts/tegra30-colibri-eval-v3.dts | 3 ++-
 6 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/tegra114-dalmore.dts b/arch/arm/boot/dts/tegra114-dalmore.dts
index 1444fbd543e7..bc2445bf582d 100644
--- a/arch/arm/boot/dts/tegra114-dalmore.dts
+++ b/arch/arm/boot/dts/tegra114-dalmore.dts
@@ -779,7 +779,7 @@
 			compatible = "realtek,rt5640";
 			reg = <0x1c>;
 			interrupt-parent = <&gpio>;
-			interrupts = <TEGRA_GPIO(W, 3) GPIO_ACTIVE_HIGH>;
+			interrupts = <TEGRA_GPIO(W, 3) IRQ_TYPE_NONE>;
 			realtek,ldo1-en-gpios =
 				<&gpio TEGRA_GPIO(V, 3) GPIO_ACTIVE_HIGH>;
 		};
diff --git a/arch/arm/boot/dts/tegra124-jetson-tk1.dts b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
index 53994f9fbbcc..8d4f1ca85a61 100644
--- a/arch/arm/boot/dts/tegra124-jetson-tk1.dts
+++ b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
@@ -1413,7 +1413,7 @@
 			compatible = "realtek,rt5639";
 			reg = <0x1c>;
 			interrupt-parent = <&gpio>;
-			interrupts = <TEGRA_GPIO(H, 4) GPIO_ACTIVE_HIGH>;
+			interrupts = <TEGRA_GPIO(H, 4) IRQ_TYPE_NONE>;
 			realtek,ldo1-en-gpios =
 				<&gpio TEGRA_GPIO(R, 2) GPIO_ACTIVE_HIGH>;
 		};
diff --git a/arch/arm/boot/dts/tegra124-venice2.dts b/arch/arm/boot/dts/tegra124-venice2.dts
index 6e59cec0962b..c595631b0a0c 100644
--- a/arch/arm/boot/dts/tegra124-venice2.dts
+++ b/arch/arm/boot/dts/tegra124-venice2.dts
@@ -612,7 +612,7 @@
 			compatible = "maxim,max98090";
 			reg = <0x10>;
 			interrupt-parent = <&gpio>;
-			interrupts = <TEGRA_GPIO(H, 4) GPIO_ACTIVE_HIGH>;
+			interrupts = <TEGRA_GPIO(H, 4) IRQ_TYPE_NONE>;
 		};
 	};
 
diff --git a/arch/arm/boot/dts/tegra30-apalis.dtsi b/arch/arm/boot/dts/tegra30-apalis.dtsi
index f6c7c3e958ac..aaaf73c0412e 100644
--- a/arch/arm/boot/dts/tegra30-apalis.dtsi
+++ b/arch/arm/boot/dts/tegra30-apalis.dtsi
@@ -656,7 +656,7 @@
 			reg = <1>;
 			clocks = <&clk16m>;
 			interrupt-parent = <&gpio>;
-			interrupts = <TEGRA_GPIO(W, 3) GPIO_ACTIVE_LOW>;
+			interrupts = <TEGRA_GPIO(W, 3) IRQ_TYPE_EDGE_RISING>;
 			spi-max-frequency = <10000000>;
 		};
 	};
@@ -671,7 +671,7 @@
 			reg = <0>;
 			clocks = <&clk16m>;
 			interrupt-parent = <&gpio>;
-			interrupts = <TEGRA_GPIO(W, 2) GPIO_ACTIVE_LOW>;
+			interrupts = <TEGRA_GPIO(W, 2) IRQ_TYPE_EDGE_RISING>;
 			spi-max-frequency = <10000000>;
 		};
 	};
diff --git a/arch/arm/boot/dts/tegra30-beaver.dts b/arch/arm/boot/dts/tegra30-beaver.dts
index 0350002849d5..8917589a78e8 100644
--- a/arch/arm/boot/dts/tegra30-beaver.dts
+++ b/arch/arm/boot/dts/tegra30-beaver.dts
@@ -1761,7 +1761,7 @@
 			compatible = "realtek,rt5640";
 			reg = <0x1c>;
 			interrupt-parent = <&gpio>;
-			interrupts = <TEGRA_GPIO(X, 3) GPIO_ACTIVE_HIGH>;
+			interrupts = <TEGRA_GPIO(X, 3) IRQ_TYPE_NONE>;
 			realtek,ldo1-en-gpios =
 				<&gpio TEGRA_GPIO(X, 2) GPIO_ACTIVE_HIGH>;
 		};
diff --git a/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts b/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts
index a8c0318743b6..07c2888d3e48 100644
--- a/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts
+++ b/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts
@@ -78,9 +78,10 @@
 			reg = <0>;
 			clocks = <&clk16m>;
 			interrupt-parent = <&gpio>;
-			interrupts = <TEGRA_GPIO(S, 0) GPIO_ACTIVE_LOW>;
+			interrupts = <TEGRA_GPIO(S, 0) IRQ_TYPE_EDGE_RISING>;
 			spi-max-frequency = <10000000>;
 		};
+
 		spidev0: spi@1 {
 			compatible = "spidev";
 			reg = <1>;
-- 
2.11.0
