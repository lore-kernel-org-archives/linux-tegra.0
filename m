From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH 3/4] ARM: dts: tegra: beaver: remove invalid uses of rsvd1
Date: Sat, 10 Feb 2018 02:33:24 +0100
Message-ID: <20180210013326.27771-4-marcel@ziswiler.com>
References: <20180210013326.27771-1-marcel@ziswiler.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180210013326.27771-1-marcel@ziswiler.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Remove invalid uses of rsvd1 from beaver device tree. Replace by actual
function names of pinmux option 1.

Taken from https://github.com/NVIDIA/tegra-pinmux-scripts commit
b0aceda108c0 ("remove invalid uses of rsvd1 from beaver config").

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
---

 arch/arm/boot/dts/tegra30-beaver.dts | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30-beaver.dts b/arch/arm/boot/dts/tegra30-beaver.dts
index 36b85a0ab0eb..ae52a5039506 100644
--- a/arch/arm/boot/dts/tegra30-beaver.dts
+++ b/arch/arm/boot/dts/tegra30-beaver.dts
@@ -260,14 +260,14 @@
 			};
 			sdmmc3_dat6_pd3 {
 				nvidia,pins = "sdmmc3_dat6_pd3";
-				nvidia,function = "rsvd1";
+				nvidia,function = "spdif";
 				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
 				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
 			};
 			sdmmc3_dat7_pd4 {
 				nvidia,pins = "sdmmc3_dat7_pd4";
-				nvidia,function = "rsvd1";
+				nvidia,function = "spdif";
 				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
 				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
@@ -281,14 +281,14 @@
 			};
 			vi_vsync_pd6 {
 				nvidia,pins = "vi_vsync_pd6";
-				nvidia,function = "rsvd1";
+				nvidia,function = "ddr";
 				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
 				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
 			};
 			vi_hsync_pd7 {
 				nvidia,pins = "vi_hsync_pd7";
-				nvidia,function = "rsvd1";
+				nvidia,function = "ddr";
 				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
 				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
@@ -806,7 +806,7 @@
 			};
 			hdmi_int_pn7 {
 				nvidia,pins = "hdmi_int_pn7";
-				nvidia,function = "rsvd1";
+				nvidia,function = "hdmi";
 				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate = <TEGRA_PIN_ENABLE>;
 				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
@@ -841,7 +841,7 @@
 			};
 			ulpi_data3_po4 {
 				nvidia,pins = "ulpi_data3_po4";
-				nvidia,function = "rsvd1";
+				nvidia,function = "uarta";
 				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
 				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
@@ -1107,21 +1107,21 @@
 			};
 			vi_d10_pt2 {
 				nvidia,pins = "vi_d10_pt2";
-				nvidia,function = "rsvd1";
+				nvidia,function = "ddr";
 				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
 				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
 			};
 			vi_d11_pt3 {
 				nvidia,pins = "vi_d11_pt3";
-				nvidia,function = "rsvd1";
+				nvidia,function = "ddr";
 				nvidia,pull = <TEGRA_PIN_PULL_UP>;
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
 				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
 			};
 			vi_d0_pt4 {
 				nvidia,pins = "vi_d0_pt4";
-				nvidia,function = "rsvd1";
+				nvidia,function = "ddr";
 				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
 				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
@@ -1151,7 +1151,7 @@
 			};
 			pu0 {
 				nvidia,pins = "pu0";
-				nvidia,function = "rsvd1";
+				nvidia,function = "owr";
 				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
 				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
@@ -1172,7 +1172,7 @@
 			};
 			pu3 {
 				nvidia,pins = "pu3";
-				nvidia,function = "rsvd1";
+				nvidia,function = "pwm0";
 				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
 				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
@@ -1193,7 +1193,7 @@
 			};
 			pu6 {
 				nvidia,pins = "pu6";
-				nvidia,function = "rsvd1";
+				nvidia,function = "pwm3";
 				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
 				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
@@ -1221,7 +1221,7 @@
 			};
 			pv3 {
 				nvidia,pins = "pv3";
-				nvidia,function = "rsvd1";
+				nvidia,function = "clk_12m_out";
 				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
 				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
@@ -1510,7 +1510,7 @@
 			};
 			pbb0 {
 				nvidia,pins = "pbb0";
-				nvidia,function = "rsvd1";
+				nvidia,function = "i2s4";
 				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
 				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
@@ -1575,7 +1575,7 @@
 			};
 			pcc1 {
 				nvidia,pins = "pcc1";
-				nvidia,function = "rsvd1";
+				nvidia,function = "i2s4";
 				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
 				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-- 
2.14.3
