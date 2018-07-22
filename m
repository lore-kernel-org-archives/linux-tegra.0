From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH 13/28] ARM: tegra: apalis_t30: drop unused mmc1/sd1 labels
Date: Sun, 22 Jul 2018 18:49:21 +0200
Message-ID: <20180722164936.20581-14-marcel@ziswiler.com>
References: <20180722164936.20581-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180722164936.20581-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Drop unused mmc1/sd1 labels.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

 arch/arm/boot/dts/tegra30-apalis-eval.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30-apalis-eval.dts b/arch/arm/boot/dts/tegra30-apalis-eval.dts
index 74d588561d9f..078b1061fb26 100644
--- a/arch/arm/boot/dts/tegra30-apalis-eval.dts
+++ b/arch/arm/boot/dts/tegra30-apalis-eval.dts
@@ -142,7 +142,7 @@
 		status = "okay";
 	};
 
-	sd1: sdhci@78000000 {
+	sdhci@78000000 {
 		status = "okay";
 		bus-width = <4>;
 		/* SD1_CD# */
@@ -150,7 +150,7 @@
 		no-1-8-v;
 	};
 
-	mmc1: sdhci@78000400 {
+	sdhci@78000400 {
 		status = "okay";
 		bus-width = <8>;
 		/* MMC1_CD# */
-- 
2.14.4
