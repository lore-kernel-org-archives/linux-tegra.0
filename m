From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2 36/37] ARM: tegra: colibri_t20: rename ac97 label to tegra_ac97
Date: Sun,  2 Sep 2018 12:09:05 +0200
Message-ID: <20180902100906.25792-37-marcel@ziswiler.com>
References: <20180902100906.25792-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180902100906.25792-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Rename ac97 label to tegra_ac97 to be more in-line with the device tree
binding documentation.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes in v2: None

 arch/arm/boot/dts/tegra20-colibri.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-colibri.dtsi b/arch/arm/boot/dts/tegra20-colibri.dtsi
index 243615f6c349..6162d193e12c 100644
--- a/arch/arm/boot/dts/tegra20-colibri.dtsi
+++ b/arch/arm/boot/dts/tegra20-colibri.dtsi
@@ -418,7 +418,7 @@
 		};
 	};
 
-	ac97: ac97@70002000 {
+	tegra_ac97: ac97@70002000 {
 		status = "okay";
 		nvidia,codec-reset-gpio =
 			<&gpio TEGRA_GPIO(V, 0) GPIO_ACTIVE_HIGH>;
@@ -734,7 +734,7 @@
 			"LineIn", "LINEINL",
 			"LineIn", "LINEINR",
 			"Mic", "MIC1";
-		nvidia,ac97-controller = <&ac97>;
+		nvidia,ac97-controller = <&tegra_ac97>;
 		clocks = <&tegra_car TEGRA20_CLK_PLL_A>,
 			 <&tegra_car TEGRA20_CLK_PLL_A_OUT0>,
 			 <&tegra_car TEGRA20_CLK_CDEV1>;
-- 
2.14.4
