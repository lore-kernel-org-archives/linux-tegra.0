From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2 13/34] ARM: tegra: apalis_t30: annotate mmc1/sd1
Date: Fri, 31 Aug 2018 18:37:55 +0200
Message-ID: <20180831163817.23970-14-marcel@ziswiler.com>
References: <20180831163817.23970-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180831163817.23970-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Annotate MMC1/SD1.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes in v2: None

 arch/arm/boot/dts/tegra30-apalis-eval.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/tegra30-apalis-eval.dts b/arch/arm/boot/dts/tegra30-apalis-eval.dts
index 3f25bb307397..15e9de06c59a 100644
--- a/arch/arm/boot/dts/tegra30-apalis-eval.dts
+++ b/arch/arm/boot/dts/tegra30-apalis-eval.dts
@@ -134,6 +134,7 @@
 		status = "okay";
 	};
 
+	/* Apalis SD1 */
 	sdhci@78000000 {
 		status = "okay";
 		bus-width = <4>;
@@ -142,6 +143,7 @@
 		no-1-8-v;
 	};
 
+	/* Apalis MMC1 */
 	sdhci@78000400 {
 		status = "okay";
 		bus-width = <8>;
-- 
2.14.4
