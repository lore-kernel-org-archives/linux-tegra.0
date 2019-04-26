From: Krishna Yarlagadda <kyarlagadda@nvidia.com>
Subject: [PATCH 1/2] dt-binding: Tegra194 pinctrl support
Date: Fri, 26 Apr 2019 08:26:17 +0530
Message-ID: <1556247378-3335-1-git-send-email-kyarlagadda@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, thierry.reding@gmail.com, jonathanh@nvidia.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
Cc: pdeschrijver@nvidia.com, josephl@nvidia.com, smangipudi@nvidia.com, ldewangan@nvidia.com, vidyas@nvidia.com, Krishna Yarlagadda <kyarlagadda@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Add new compatible string and other fields used in pinctrl
driver for Tegra194 in nvidia,tegra210-pinmux.txt

Signed-off-by: Krishna Yarlagadda <kyarlagadda@nvidia.com>
---
 .../bindings/pinctrl/nvidia,tegra210-pinmux.txt    | 43 +++++++++++++++++++---
 1 file changed, 38 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra210-pinmux.txt b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra210-pinmux.txt
index 85f2114..c4e802d 100644
--- a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra210-pinmux.txt
+++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra210-pinmux.txt
@@ -1,7 +1,7 @@
-NVIDIA Tegra210 pinmux controller
+NVIDIA Tegra210/194 pinmux controller
 
 Required properties:
-- compatible: "nvidia,tegra210-pinmux"
+- compatible: "nvidia,tegra210-pinmux" or "nvidia,tegra194-pinmux"
 - reg: Should contain a list of base address and size pairs for:
   - first entry: The APB_MISC_GP_*_PADCTRL registers (pad control)
   - second entry: The PINMUX_AUX_* registers (pinmux)
@@ -83,6 +83,10 @@ Valid values for pin and group names (nvidia,pin) are:
     These correspond to Tegra PINMUX_AUX_* (pinmux) registers. Any property
     that exists in those registers may be set for the following pin names.
 
+  Tegra194:
+    pex_l5_clkreq_n_pgg0, pex_l5_rst_n_pgg1
+
+  Tegra210:
     In Tegra210, many pins also have a dedicated APB_MISC_GP_*_PADCTRL
     register. Where that is true, and property that exists in that register
     may also be set on the following pin names.
@@ -127,12 +131,15 @@ Valid values for pin and group names (nvidia,pin) are:
     registers. Note that where one of these registers controls a single pin
     for which a PINMUX_AUX_* exists, see the list above for the pin name to
     use when configuring the pinmux.
-
+  Tegra210:
     pa6, pcc7, pe6, pe7, ph6, pk0, pk1, pk2, pk3, pk4, pk5, pk6, pk7, pl0, pl1,
     pz0, pz1, pz2, pz3, pz4, pz5, sdmmc1, sdmmc2, sdmmc3, sdmmc4
+  Tegra194:
+    pex_l5_clkreq_n_pgg0, pex_l5_rst_n_pgg1
 
 Valid values for nvidia,functions are:
 
+  Tegra210:
     aud, bcl, blink, ccla, cec, cldvfs, clk, core, cpu, displaya, displayb,
     dmic1, dmic2, dmic3, dp, dtv, extperiph3, i2c1, i2c2, i2c3, i2cpmu, i2cvi,
     i2s1, i2s2, i2s3, i2s4a, i2s4b, i2s5a, i2s5b, iqc0, iqc1, jtag, pe, pe0,
@@ -140,9 +147,12 @@ Valid values for nvidia,functions are:
     sdmmc1, sdmmc3, shutdown, soc, sor0, sor1, spdif, spi1, spi2, spi3, spi4,
     sys, touch, uart, uarta, uartb, uartc, uartd, usb, vgp1, vgp2, vgp3, vgp4,
     vgp5, vgp6, vimclk, vimclk2
+  Tegra194:
+    pe5
 
-Example:
+Examples:
 
+  Tegra210:
 	pinmux: pinmux@70000800 {
 		compatible = "nvidia,tegra210-pinmux";
 		reg = <0x0 0x700008d4 0x0 0x2a8>, /* Pad control registers */
@@ -163,4 +173,27 @@ Example:
 			};
 		};
 	};
-};
+
+  Tegra194:
+		tegra_pinctrl: pinmux: pinmux@2430000 {
+			compatible = "nvidia,tegra194-pinmux";
+			reg = <0x2430000 0x17000
+			       0xc300000 0x4000>;
+			#gpio-range-cells = <2>;
+			pex_rst_c5_out_state: pex_rst_c5_out {
+				pex_rst {
+					nvidia,pins = "pex_l5_rst_n_pgg1";
+					nvidia,schmitt = <TEGRA_PIN_DISABLE>;
+					nvidia,lpdr = <TEGRA_PIN_ENABLE>;
+					nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+					nvidia,io-high-voltage = <TEGRA_PIN_ENABLE>;
+					nvidia,tristate = <TEGRA_PIN_DISABLE>;
+					nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				};
+			};
+		};
+		pinmuxtest@0 {
+			compatible = "nvidia,tegra194-pinmux-test";
+			pinctrl-names = "pex_rst";
+			pinctrl-0 = <&pex_rst_c5_out_state>;
+		};
-- 
2.7.4
