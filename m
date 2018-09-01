From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2 27/34] ARM: tegra: colibri_t30: drop obsolete spidev node
Date: Sat,  1 Sep 2018 10:12:41 +0200
Message-ID: <20180901081248.22639-28-marcel@ziswiler.com>
References: <20180901081248.22639-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180901081248.22639-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Drop obsolete spidev device tree node as nowadays one should do this
by binding the spidev driver to specific instances/chip selects at
runtime.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes in v2:
- New patch.

 arch/arm/boot/dts/tegra30-colibri-eval-v3.dts | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts b/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts
index aca4cd786442..c08e09908578 100644
--- a/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts
+++ b/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts
@@ -88,12 +88,6 @@
 			interrupts = <TEGRA_GPIO(S, 0) IRQ_TYPE_EDGE_RISING>;
 			spi-max-frequency = <10000000>;
 		};
-
-		spidev0: spi@1 {
-			compatible = "spidev";
-			reg = <1>;
-			spi-max-frequency = <25000000>;
-		};
 	};
 
 	/* SD/MMC */
-- 
2.14.4
