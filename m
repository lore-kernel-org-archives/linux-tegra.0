From: Paul Kocialkowski <contact@paulk.fr>
Subject: [PATCH v2 5/6] ARM: tegra: nyan-big: Proper pinmux for TPM i2c
Date: Sun, 22 Jan 2017 16:47:52 +0100
Message-ID: <20170122154753.31942-5-contact@paulk.fr>
References: <20170122154753.31942-1-contact@paulk.fr>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170122154753.31942-1-contact@paulk.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-tegra@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Mikko Perttunen <cyndis@kapsi.fi>, Peter Rosin <peda@axentia.se>, Paul Kocialkowski <contact@paulk.fr>
List-Id: linux-tegra@vger.kernel.org

This corrects the pinmux for accessing the TPM over the i2c line.
Thus, it allows correctly probing the module, that previously failed with i2c
errors.

Signed-off-by: Paul Kocialkowski <contact@paulk.fr>
---
 arch/arm/boot/dts/tegra124-nyan-big.dts | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/tegra124-nyan-big.dts b/arch/arm/boot/dts/tegra124-nyan-big.dts
index f12ece9b76a6..03eedf86dc48 100644
--- a/arch/arm/boot/dts/tegra124-nyan-big.dts
+++ b/arch/arm/boot/dts/tegra124-nyan-big.dts
@@ -1103,19 +1103,19 @@
 			};
 			cam_i2c_scl_pbb1 {
 				nvidia,pins = "cam_i2c_scl_pbb1";
-				nvidia,function = "rsvd3";
-				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
-				nvidia,tristate = <TEGRA_PIN_ENABLE>;
-				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
-				nvidia,open-drain = <TEGRA_PIN_DISABLE>;
+				nvidia,function = "i2c3";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+				nvidia,open-drain = <TEGRA_PIN_ENABLE>;
 			};
 			cam_i2c_sda_pbb2 {
 				nvidia,pins = "cam_i2c_sda_pbb2";
-				nvidia,function = "rsvd3";
-				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
-				nvidia,tristate = <TEGRA_PIN_ENABLE>;
-				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
-				nvidia,open-drain = <TEGRA_PIN_DISABLE>;
+				nvidia,function = "i2c3";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+				nvidia,open-drain = <TEGRA_PIN_ENABLE>;
 			};
 			pbb3 {
 				nvidia,pins = "pbb3";
-- 
2.11.0
