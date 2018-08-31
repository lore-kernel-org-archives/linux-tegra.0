From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2 33/34] ARM: tegra: apalis_t30: move hda node from carrier to module
Date: Fri, 31 Aug 2018 18:38:15 +0200
Message-ID: <20180831163817.23970-34-marcel@ziswiler.com>
References: <20180831163817.23970-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180831163817.23970-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Move the hda node from the carrier board to the module level device
tree.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes in v2:
- New patch.

 arch/arm/boot/dts/tegra30-apalis-eval.dts | 4 ----
 arch/arm/boot/dts/tegra30-apalis.dtsi     | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30-apalis-eval.dts b/arch/arm/boot/dts/tegra30-apalis-eval.dts
index fdfadda72e0d..749fc6d1ff70 100644
--- a/arch/arm/boot/dts/tegra30-apalis-eval.dts
+++ b/arch/arm/boot/dts/tegra30-apalis-eval.dts
@@ -119,10 +119,6 @@
 		spi-max-frequency = <25000000>;
 	};
 
-	hda@70030000 {
-		status = "okay";
-	};
-
 	/* Apalis SD1 */
 	sdhci@78000000 {
 		status = "okay";
diff --git a/arch/arm/boot/dts/tegra30-apalis.dtsi b/arch/arm/boot/dts/tegra30-apalis.dtsi
index e44b2bce6736..23cecd327172 100644
--- a/arch/arm/boot/dts/tegra30-apalis.dtsi
+++ b/arch/arm/boot/dts/tegra30-apalis.dtsi
@@ -1078,6 +1078,10 @@
 		};
 	};
 
+	hda@70030000 {
+		status = "okay";
+	};
+
 	ahub@70080000 {
 		i2s@70080500 {
 			status = "okay";
-- 
2.14.4
