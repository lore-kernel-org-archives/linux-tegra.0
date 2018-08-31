From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2 20/34] ARM: tegra: apalis_t30: further lm95245 temperature sensor annotation
Date: Fri, 31 Aug 2018 18:38:02 +0200
Message-ID: <20180831163817.23970-21-marcel@ziswiler.com>
References: <20180831163817.23970-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180831163817.23970-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Further LM95245 temperature sensor annotation.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes in v2: None

 arch/arm/boot/dts/tegra30-apalis.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra30-apalis.dtsi b/arch/arm/boot/dts/tegra30-apalis.dtsi
index 43d914f754e8..c3e37d944c62 100644
--- a/arch/arm/boot/dts/tegra30-apalis.dtsi
+++ b/arch/arm/boot/dts/tegra30-apalis.dtsi
@@ -1009,7 +1009,7 @@
 
 		/*
 		 * LM95245 temperature sensor
-		 * Note: OVERT_N directly connected to PMIC PWRDN
+		 * Note: OVERT1# directly connected to TPS65911 PMIC PWRDN
 		 */
 		temp-sensor@4c {
 			compatible = "national,lm95245";
-- 
2.14.4
