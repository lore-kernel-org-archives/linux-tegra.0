From: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v3 1/2] pinctrl: tegra: Add MIPI pad control
Date: Tue,  9 Sep 2014 15:58:45 -0400
Message-ID: <1410292726-9179-1-git-send-email-seanpaul@chromium.org>
References: <54088B53.6040802@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54088B53.6040802-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, davidriley-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This patch adds MIPI CSI/DSIB pad control mux register
from the APB misc block to tegra pinctrl.

Without writing to this register, the dsib pads are
muxed as csi, and cannot be used.

The register is not yet documented in the TRM, here is
the description:

70000820: APB_MISC_GP_MIPI_PAD_CTRL_0
	[31:02] RESERVED
	[01:01] DSIB_MODE       [CSI=0,DSIB=1]
	[00:00] RESERVED

Signed-off-by: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---

Changes in v2:
        - Added devicetree binding documentation
	- Added discrete pins for all pads, grouped in apb_dsi_b group
	- Changed group naming to be consistent with the other groups
	- Fixed compilation errors
	- Fixed indentation in tegra124_groups

Changes in v3:
	- Renamed group to mipi pad ctrl

 .../bindings/pinctrl/nvidia,tegra124-pinmux.txt    | 14 ++++-
 drivers/pinctrl/pinctrl-tegra124.c                 | 67 ++++++++++++++++++++++
 2 files changed, 78 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-pinmux.txt b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-pinmux.txt
index 6464bf7..189814e 100644
--- a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-pinmux.txt
+++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-pinmux.txt
@@ -10,6 +10,7 @@ Required properties:
 - reg: Should contain a list of base address and size pairs for:
     -- first entry - the drive strength and pad control registers.
     -- second entry - the pinmux registers
+    -- third entry - the MIPI_PAD_CTRL register
 
 Tegra124 adds the following optional properties for pin configuration subnodes.
 The macros for options are defined in the
@@ -91,6 +92,12 @@ Valid values for pin and group names are:
     dbg, sdio3, spi, uaa, uab, uart2, uart3, sdio1, ddc, gma, gme, gmf, gmg,
     gmh, owr, uda, gpv, dev3, cec, usb_vbus_en, ao3, ao0, hv0, sdio4, ao4.
 
+  MIPI pad control groups:
+
+    These support only the nvidia,function property.
+
+    dsi_b
+
 Valid values for nvidia,functions are:
 
   blink, cec, cldvfs, clk12, cpu, dap, dap1, dap2, dev3, displaya,
@@ -101,14 +108,15 @@ Valid values for nvidia,functions are:
   sdmmc4, soc, spdif, spi1, spi2, spi3, spi4, spi5, spi6, trace, uarta,
   uartb, uartc, uartd, ulpi, usb, vgp1, vgp2, vgp3, vgp4, vgp5, vgp6,
   vi, vi_alt1, vi_alt3, vimclk2, vimclk2_alt, sata, ccla, pe0, pe, pe1,
-  dp, rtck, sys, clk tmds.
+  dp, rtck, sys, clk tmds, csi, dsi_b
 
 Example:
 
 	pinmux: pinmux {
 		compatible = "nvidia,tegra124-pinmux";
-		reg = <0x70000868 0x164		/* Pad control registers */
-		       0x70003000 0x434>;	/* PinMux registers */
+		reg = <0x0 0x70000868 0x0 0x164>, /* Pad control registers */
+		      <0x0 0x70003000 0x0 0x434>, /* Mux registers */
+		      <0x0 0x70000820 0x0 0x8>;   /* MIPI pad control */
 	};
 
 Example pinmux entries:
diff --git a/drivers/pinctrl/pinctrl-tegra124.c b/drivers/pinctrl/pinctrl-tegra124.c
index e80797e..287d374c 100644
--- a/drivers/pinctrl/pinctrl-tegra124.c
+++ b/drivers/pinctrl/pinctrl-tegra124.c
@@ -224,6 +224,16 @@
 #define TEGRA_PIN_OWR				_PIN(5)
 #define TEGRA_PIN_CLK_32K_IN			_PIN(6)
 #define TEGRA_PIN_JTAG_RTCK			_PIN(7)
+#define TEGRA_PIN_DSI_B_CLK_P			_PIN(8)
+#define TEGRA_PIN_DSI_B_CLK_N			_PIN(9)
+#define TEGRA_PIN_DSI_B_D0_P			_PIN(10)
+#define TEGRA_PIN_DSI_B_D0_N			_PIN(11)
+#define TEGRA_PIN_DSI_B_D1_P			_PIN(12)
+#define TEGRA_PIN_DSI_B_D1_N			_PIN(13)
+#define TEGRA_PIN_DSI_B_D2_P			_PIN(14)
+#define TEGRA_PIN_DSI_B_D2_N			_PIN(15)
+#define TEGRA_PIN_DSI_B_D3_P			_PIN(16)
+#define TEGRA_PIN_DSI_B_D3_N			_PIN(17)
 
 static const struct pinctrl_pin_desc tegra124_pins[] = {
 	PINCTRL_PIN(TEGRA_PIN_CLK_32K_OUT_PA0, "CLK_32K_OUT PA0"),
@@ -417,6 +427,16 @@ static const struct pinctrl_pin_desc tegra124_pins[] = {
 	PINCTRL_PIN(TEGRA_PIN_OWR, "OWR"),
 	PINCTRL_PIN(TEGRA_PIN_CLK_32K_IN, "CLK_32K_IN"),
 	PINCTRL_PIN(TEGRA_PIN_JTAG_RTCK, "JTAG_RTCK"),
+	PINCTRL_PIN(TEGRA_PIN_DSI_B_CLK_P, "DSI_B_CLK_P"),
+	PINCTRL_PIN(TEGRA_PIN_DSI_B_CLK_N, "DSI_B_CLK_N"),
+	PINCTRL_PIN(TEGRA_PIN_DSI_B_D0_P, "DSI_B_D0_P"),
+	PINCTRL_PIN(TEGRA_PIN_DSI_B_D0_N, "DSI_B_D0_N"),
+	PINCTRL_PIN(TEGRA_PIN_DSI_B_D1_P, "DSI_B_D1_P"),
+	PINCTRL_PIN(TEGRA_PIN_DSI_B_D1_N, "DSI_B_D1_N"),
+	PINCTRL_PIN(TEGRA_PIN_DSI_B_D2_P, "DSI_B_D2_P"),
+	PINCTRL_PIN(TEGRA_PIN_DSI_B_D2_N, "DSI_B_D2_N"),
+	PINCTRL_PIN(TEGRA_PIN_DSI_B_D3_P, "DSI_B_D3_P"),
+	PINCTRL_PIN(TEGRA_PIN_DSI_B_D3_N, "DSI_B_D3_N"),
 };
 
 static const unsigned clk_32k_out_pa0_pins[] = {
@@ -1495,6 +1515,19 @@ static const unsigned drive_ao4_pins[] = {
 	TEGRA_PIN_JTAG_RTCK,
 };
 
+static const unsigned mipi_pad_ctrl_dsi_b_pins[] = {
+	TEGRA_PIN_DSI_B_CLK_P,
+	TEGRA_PIN_DSI_B_CLK_N,
+	TEGRA_PIN_DSI_B_D0_P,
+	TEGRA_PIN_DSI_B_D0_N,
+	TEGRA_PIN_DSI_B_D1_P,
+	TEGRA_PIN_DSI_B_D1_N,
+	TEGRA_PIN_DSI_B_D2_P,
+	TEGRA_PIN_DSI_B_D2_N,
+	TEGRA_PIN_DSI_B_D3_P,
+	TEGRA_PIN_DSI_B_D3_N,
+};
+
 enum tegra_mux {
 	TEGRA_MUX_BLINK,
 	TEGRA_MUX_CCLA,
@@ -1580,6 +1613,8 @@ enum tegra_mux {
 	TEGRA_MUX_VI_ALT3,
 	TEGRA_MUX_VIMCLK2,
 	TEGRA_MUX_VIMCLK2_ALT,
+	TEGRA_MUX_CSI,
+	TEGRA_MUX_DSI_B,
 };
 
 #define FUNCTION(fname)					\
@@ -1672,10 +1707,13 @@ static struct tegra_function tegra124_functions[] = {
 	FUNCTION(vi_alt3),
 	FUNCTION(vimclk2),
 	FUNCTION(vimclk2_alt),
+	FUNCTION(csi),
+	FUNCTION(dsi_b),
 };
 
 #define DRV_PINGROUP_REG_A		0x868	/* bank 0 */
 #define PINGROUP_REG_A			0x3000	/* bank 1 */
+#define MIPI_PAD_CTRL_PINGROUP_REG_A	0x820	/* bank 2 */
 
 #define PINGROUP_REG(r)			((r) - PINGROUP_REG_A)
 
@@ -1744,6 +1782,32 @@ static struct tegra_function tegra124_functions[] = {
 		.drvtype_bit = PINGROUP_BIT_##drvtype(6),		\
 	}
 
+#define MIPI_PAD_CTRL_PINGROUP_REG_Y(r)	((r) - MIPI_PAD_CTRL_PINGROUP_REG_A)
+
+#define MIPI_PAD_CTRL_PINGROUP(pg_name, r, b, f0, f1)			\
+	{								\
+		.name = "mipi_pad_ctrl_" #pg_name,			\
+		.pins = mipi_pad_ctrl_##pg_name##_pins,			\
+		.npins = ARRAY_SIZE(mipi_pad_ctrl_##pg_name##_pins),	\
+		.funcs = {						\
+			TEGRA_MUX_ ## f0,				\
+			TEGRA_MUX_ ## f1,				\
+			TEGRA_MUX_RSVD3,				\
+			TEGRA_MUX_RSVD4,				\
+		},							\
+		.mux_reg = MIPI_PAD_CTRL_PINGROUP_REG_Y(r),		\
+		.mux_bank = 2,						\
+		.mux_bit = b,						\
+		.pupd_reg = -1,						\
+		.tri_reg = -1,						\
+		.einput_bit = -1,					\
+		.odrain_bit = -1,					\
+		.lock_bit = -1,						\
+		.ioreset_bit = -1,					\
+		.rcv_sel_bit = -1,					\
+		.drv_reg = -1,						\
+	}
+
 static const struct tegra_pingroup tegra124_groups[] = {
 	/*       pg_name,                f0,         f1,         f2,           f3,          r,      od, ior, rcv_sel */
 	PINGROUP(ulpi_data0_po1,         SPI3,       HSI,        UARTA,        ULPI,        0x3000, N,   N,  N),
@@ -1979,6 +2043,9 @@ static const struct tegra_pingroup tegra124_groups[] = {
 	DRV_PINGROUP(hv0,         0x9b4,  2,  3,  4,  12,  5,  -1, -1,  28,  2,  -1, -1,  N),
 	DRV_PINGROUP(sdio4,       0x9c4,  2,  3,  4,  12,  5,  20,  5,  28,  2,  30,  2,  N),
 	DRV_PINGROUP(ao4,         0x9c8,  2,  3,  4,  12,  7,  20,  7,  28,  2,  30,  2,  Y),
+
+	/*		       pg_name, r      b  f0,  f1 */
+	MIPI_PAD_CTRL_PINGROUP(dsi_b,   0x820, 1, CSI, DSI_B)
 };
 
 static const struct tegra_pinctrl_soc_data tegra124_pinctrl = {
-- 
2.0.0
