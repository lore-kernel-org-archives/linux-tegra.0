From: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH] pinctrl: tegra: Add APB misc MIPI pad control
Date: Tue,  2 Sep 2014 13:18:06 -0400
Message-ID: <1409678286-28139-1-git-send-email-seanpaul@chromium.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, davidriley-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
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
 drivers/pinctrl/pinctrl-tegra124.c | 48 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-tegra124.c b/drivers/pinctrl/pinctrl-tegra124.c
index e80797e..9a3359f 100644
--- a/drivers/pinctrl/pinctrl-tegra124.c
+++ b/drivers/pinctrl/pinctrl-tegra124.c
@@ -224,6 +224,7 @@
 #define TEGRA_PIN_OWR				_PIN(5)
 #define TEGRA_PIN_CLK_32K_IN			_PIN(6)
 #define TEGRA_PIN_JTAG_RTCK			_PIN(7)
+#define TEGRA_PIN_CSI_DSIB			_PIN(8)
 
 static const struct pinctrl_pin_desc tegra124_pins[] = {
 	PINCTRL_PIN(TEGRA_PIN_CLK_32K_OUT_PA0, "CLK_32K_OUT PA0"),
@@ -417,6 +418,7 @@ static const struct pinctrl_pin_desc tegra124_pins[] = {
 	PINCTRL_PIN(TEGRA_PIN_OWR, "OWR"),
 	PINCTRL_PIN(TEGRA_PIN_CLK_32K_IN, "CLK_32K_IN"),
 	PINCTRL_PIN(TEGRA_PIN_JTAG_RTCK, "JTAG_RTCK"),
+	PINCTRL_PIN(TEGRA_PIN_CSI_DSIB, "CSI_DSIB"),
 };
 
 static const unsigned clk_32k_out_pa0_pins[] = {
@@ -1495,6 +1497,10 @@ static const unsigned drive_ao4_pins[] = {
 	TEGRA_PIN_JTAG_RTCK,
 };
 
+static const unsigned csi_dsib_pins[] = {
+	TEGRA_PIN_CSI_DSIB,
+};
+
 enum tegra_mux {
 	TEGRA_MUX_BLINK,
 	TEGRA_MUX_CCLA,
@@ -1580,6 +1586,16 @@ enum tegra_mux {
 	TEGRA_MUX_VI_ALT3,
 	TEGRA_MUX_VIMCLK2,
 	TEGRA_MUX_VIMCLK2_ALT,
+	TEGRA_MUX_CSI,
+	TEGRA_MUX_DSIB,
+};
+
+static const char * const csi_groups[] = {
+	"csi_dsib",
+};
+
+static const char * const dsib_groups[] = {
+	"csi_dsib",
 };
 
 #define FUNCTION(fname)					\
@@ -1672,10 +1688,13 @@ static struct tegra_function tegra124_functions[] = {
 	FUNCTION(vi_alt3),
 	FUNCTION(vimclk2),
 	FUNCTION(vimclk2_alt),
+	FUNCTION(csi),
+	FUNCTION(dsib),
 };
 
 #define DRV_PINGROUP_REG_A		0x868	/* bank 0 */
 #define PINGROUP_REG_A			0x3000	/* bank 1 */
+#define APB_MISC_PINGROUP_REG_A		0x820	/* bank 2 */
 
 #define PINGROUP_REG(r)			((r) - PINGROUP_REG_A)
 
@@ -1744,6 +1763,32 @@ static struct tegra_function tegra124_functions[] = {
 		.drvtype_bit = PINGROUP_BIT_##drvtype(6),		\
 	}
 
+#define APB_MISC_PINGROUP_REG_Y(r)	((r) - APB_MISC_PINGROUP_REG_A)
+
+#define APB_MISC_PINGROUP(pg_name, r, b, f0, f1, f_safe)		\
+	{								\
+		.name = #pg_name,					\
+		.pins = pg_name##_pins,					\
+		.npins = ARRAY_SIZE(pg_name##_pins),			\
+		.funcs = {						\
+			TEGRA_MUX_ ## f0,				\
+			TEGRA_MUX_ ## f1,				\
+		},							\
+		.func_safe = TEGRA_MUX_ ## f_safe,			\
+		.mux_reg = APB_MISC_PINGROUP_REG_Y(r),			\
+		.mux_bank = 2,						\
+		.mux_bit = b,						\
+		.pupd_reg = -1,						\
+		.tri_reg = -1,						\
+		.einput_reg = -1,					\
+		.odrain_reg = -1,					\
+		.lock_reg = -1,						\
+		.ioreset_reg = -1,					\
+		.rcv_sel_reg = -1,					\
+		.drv_reg = -1,						\
+		.drvtype_reg = -1,					\
+	}
+
 static const struct tegra_pingroup tegra124_groups[] = {
 	/*       pg_name,                f0,         f1,         f2,           f3,          r,      od, ior, rcv_sel */
 	PINGROUP(ulpi_data0_po1,         SPI3,       HSI,        UARTA,        ULPI,        0x3000, N,   N,  N),
@@ -1979,6 +2024,9 @@ static const struct tegra_pingroup tegra124_groups[] = {
 	DRV_PINGROUP(hv0,         0x9b4,  2,  3,  4,  12,  5,  -1, -1,  28,  2,  -1, -1,  N),
 	DRV_PINGROUP(sdio4,       0x9c4,  2,  3,  4,  12,  5,  20,  5,  28,  2,  30,  2,  N),
 	DRV_PINGROUP(ao4,         0x9c8,  2,  3,  4,  12,  7,  20,  7,  28,  2,  30,  2,  Y),
+
+       /*			pg_name,	r	b	f0,	f1,	f_safe */
+       APB_MISC_PINGROUP(	csi_dsib,	0x820,	1,	CSI,	DSIB,	DSIB)
 };
 
 static const struct tegra_pinctrl_soc_data tegra124_pinctrl = {
-- 
2.0.0
