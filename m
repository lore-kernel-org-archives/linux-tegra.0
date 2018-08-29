From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH 06/31] ARM: tegra: colibri_t20: reorder host1x/hdmi properties
Date: Wed, 29 Aug 2018 10:13:42 +0200
Message-ID: <20180829081407.11304-7-marcel@ziswiler.com>
References: <20180829081407.11304-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180829081407.11304-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Reorder Host1x/HDMI properties.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

 arch/arm/boot/dts/tegra20-colibri.dtsi | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-colibri.dtsi b/arch/arm/boot/dts/tegra20-colibri.dtsi
index ad816fa827f7..c060b58cb490 100644
--- a/arch/arm/boot/dts/tegra20-colibri.dtsi
+++ b/arch/arm/boot/dts/tegra20-colibri.dtsi
@@ -16,12 +16,11 @@
 
 	host1x@50000000 {
 		hdmi@54280000 {
-			vdd-supply = <&hdmi_vdd_reg>;
-			pll-supply = <&hdmi_pll_reg>;
-
 			nvidia,ddc-i2c-bus = <&i2c_ddc>;
-			nvidia,hpd-gpio = <&gpio TEGRA_GPIO(N, 7)
-				GPIO_ACTIVE_HIGH>;
+			nvidia,hpd-gpio =
+				<&gpio TEGRA_GPIO(N, 7) GPIO_ACTIVE_HIGH>;
+			pll-supply = <&hdmi_pll_reg>;
+			vdd-supply = <&hdmi_vdd_reg>;
 		};
 	};
 
-- 
2.14.4
