From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2 06/34] ARM: tegra: apalis_t30: reorder host1x/hdmi properties
Date: Fri, 31 Aug 2018 18:37:48 +0200
Message-ID: <20180831163817.23970-7-marcel@ziswiler.com>
References: <20180831163817.23970-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180831163817.23970-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Reorder Host1x/HDMI properties.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes in v2: None

 arch/arm/boot/dts/tegra30-apalis.dtsi | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30-apalis.dtsi b/arch/arm/boot/dts/tegra30-apalis.dtsi
index c810c044025a..648db524abae 100644
--- a/arch/arm/boot/dts/tegra30-apalis.dtsi
+++ b/arch/arm/boot/dts/tegra30-apalis.dtsi
@@ -48,12 +48,11 @@
 
 	host1x@50000000 {
 		hdmi@54280000 {
-			vdd-supply = <&avdd_hdmi_3v3_reg>;
-			pll-supply = <&avdd_hdmi_pll_1v8_reg>;
-
+			nvidia,ddc-i2c-bus = <&hdmiddc>;
 			nvidia,hpd-gpio =
 				<&gpio TEGRA_GPIO(N, 7) GPIO_ACTIVE_HIGH>;
-			nvidia,ddc-i2c-bus = <&hdmiddc>;
+			pll-supply = <&avdd_hdmi_pll_1v8_reg>;
+			vdd-supply = <&avdd_hdmi_3v3_reg>;
 		};
 	};
 
-- 
2.14.4
