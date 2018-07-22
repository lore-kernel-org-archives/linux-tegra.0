From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH 21/28] ARM: tegra: apalis_t30: further lm95245 temperature sensor annotation
Date: Sun, 22 Jul 2018 18:49:29 +0200
Message-ID: <20180722164936.20581-22-marcel@ziswiler.com>
References: <20180722164936.20581-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180722164936.20581-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Further LM95245 temperature sensor annotation.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

 arch/arm/boot/dts/tegra30-apalis.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra30-apalis.dtsi b/arch/arm/boot/dts/tegra30-apalis.dtsi
index ab4fe7491bbf..4e8ea1a8d9ec 100644
--- a/arch/arm/boot/dts/tegra30-apalis.dtsi
+++ b/arch/arm/boot/dts/tegra30-apalis.dtsi
@@ -993,7 +993,7 @@
 
 		/*
 		 * LM95245 temperature sensor
-		 * Note: OVERT_N directly connected to PMIC PWRDN
+		 * Note: OVERT1# directly connected to TPS65911 PMIC PWRDN
 		 */
 		temp-sensor@4c {
 			compatible = "national,lm95245";
-- 
2.14.4
