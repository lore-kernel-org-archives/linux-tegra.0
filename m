From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH 14/28] ARM: tegra: apalis_t30: annotate mmc1/sd1
Date: Sun, 22 Jul 2018 18:49:22 +0200
Message-ID: <20180722164936.20581-15-marcel@ziswiler.com>
References: <20180722164936.20581-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180722164936.20581-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Annotate MMC1/SD1.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

 arch/arm/boot/dts/tegra30-apalis-eval.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/tegra30-apalis-eval.dts b/arch/arm/boot/dts/tegra30-apalis-eval.dts
index 078b1061fb26..a1ae4c3ee39c 100644
--- a/arch/arm/boot/dts/tegra30-apalis-eval.dts
+++ b/arch/arm/boot/dts/tegra30-apalis-eval.dts
@@ -142,6 +142,7 @@
 		status = "okay";
 	};
 
+	/* Apalis SD1 */
 	sdhci@78000000 {
 		status = "okay";
 		bus-width = <4>;
@@ -150,6 +151,7 @@
 		no-1-8-v;
 	};
 
+	/* Apalis MMC1 */
 	sdhci@78000400 {
 		status = "okay";
 		bus-width = <8>;
-- 
2.14.4
