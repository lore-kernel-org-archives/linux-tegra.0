From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 1/4] pinctrl: tegra: driver layout/consistency fixes
Date: Tue, 24 Feb 2015 14:00:48 -0700
Message-ID: <1424811651-18660-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Various non-semantic tweaks and layout/consistency fixes for existing
Tegra pinctrl drivers.

Move the definition of DRV_PINGROUP_REG() before the definition of
PINGROUP() so that a future SoC driver can invoke the former from the
latter.

PINGROUP_BIT_Y(n) is just n, so replace it with n.

Re-wrap the parameters to *PINGROUP().

Keep various enums sorted in the Tegra124 driver.

Various white-space consistency fixes.

These changes aim to update existing drivers to be consistent with future
SoC drivers. While we could ignore these tweaks to the existing drivers,
I'd like to keep everything as consistent as possible for easy comparison.
Besides, I auto-generate the drivers, and maintaining special-cases to
keep the differences in place is annoying.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/pinctrl/pinctrl-tegra114.c |  14 ++---
 drivers/pinctrl/pinctrl-tegra124.c |  29 +++++-----
 drivers/pinctrl/pinctrl-tegra30.c  | 113 ++++++++++++++++++-------------------
 3 files changed, 75 insertions(+), 81 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-tegra114.c b/drivers/pinctrl/pinctrl-tegra114.c
index 52e4ec6386b4..0740cdba7508 100644
--- a/drivers/pinctrl/pinctrl-tegra114.c
+++ b/drivers/pinctrl/pinctrl-tegra114.c
@@ -1547,6 +1547,7 @@ static struct tegra_function tegra114_functions[] = {
 #define DRV_PINGROUP_REG_A		0x868	/* bank 0 */
 #define PINGROUP_REG_A			0x3000	/* bank 1 */
 
+#define DRV_PINGROUP_REG(r)		((r) - DRV_PINGROUP_REG_A)
 #define PINGROUP_REG(r)			((r) - PINGROUP_REG_A)
 
 #define PINGROUP_BIT_Y(b)		(b)
@@ -1572,20 +1573,17 @@ static struct tegra_function tegra114_functions[] = {
 		.tri_reg = PINGROUP_REG(r),				\
 		.tri_bank = 1,						\
 		.tri_bit = 4,						\
-		.einput_bit = PINGROUP_BIT_Y(5),			\
+		.einput_bit = 5,					\
 		.odrain_bit = PINGROUP_BIT_##od(6),			\
-		.lock_bit = PINGROUP_BIT_Y(7),				\
+		.lock_bit = 7,						\
 		.ioreset_bit = PINGROUP_BIT_##ior(8),			\
 		.rcv_sel_bit = PINGROUP_BIT_##rcv_sel(9),		\
 		.drv_reg = -1,						\
 	}
 
-#define DRV_PINGROUP_REG(r)		((r) - DRV_PINGROUP_REG_A)
-
-#define DRV_PINGROUP(pg_name, r, hsm_b, schmitt_b, lpmd_b,		\
-		     drvdn_b, drvdn_w, drvup_b, drvup_w,		\
-		     slwr_b, slwr_w, slwf_b, slwf_w,			\
-		     drvtype)						\
+#define DRV_PINGROUP(pg_name, r, hsm_b, schmitt_b, lpmd_b, drvdn_b,	\
+		     drvdn_w, drvup_b, drvup_w, slwr_b, slwr_w,		\
+		     slwf_b, slwf_w, drvtype)				\
 	{								\
 		.name = "drive_" #pg_name,				\
 		.pins = drive_##pg_name##_pins,				\
diff --git a/drivers/pinctrl/pinctrl-tegra124.c b/drivers/pinctrl/pinctrl-tegra124.c
index 2b20906c5356..b7ba26064dbf 100644
--- a/drivers/pinctrl/pinctrl-tegra124.c
+++ b/drivers/pinctrl/pinctrl-tegra124.c
@@ -1536,6 +1536,7 @@ enum tegra_mux {
 	TEGRA_MUX_CLK,
 	TEGRA_MUX_CLK12,
 	TEGRA_MUX_CPU,
+	TEGRA_MUX_CSI,
 	TEGRA_MUX_DAP,
 	TEGRA_MUX_DAP1,
 	TEGRA_MUX_DAP2,
@@ -1544,6 +1545,7 @@ enum tegra_mux {
 	TEGRA_MUX_DISPLAYA_ALT,
 	TEGRA_MUX_DISPLAYB,
 	TEGRA_MUX_DP,
+	TEGRA_MUX_DSI_B,
 	TEGRA_MUX_DTV,
 	TEGRA_MUX_EXTPERIPH1,
 	TEGRA_MUX_EXTPERIPH2,
@@ -1613,8 +1615,6 @@ enum tegra_mux {
 	TEGRA_MUX_VI_ALT3,
 	TEGRA_MUX_VIMCLK2,
 	TEGRA_MUX_VIMCLK2_ALT,
-	TEGRA_MUX_CSI,
-	TEGRA_MUX_DSI_B,
 };
 
 #define FUNCTION(fname)					\
@@ -1630,6 +1630,7 @@ static struct tegra_function tegra124_functions[] = {
 	FUNCTION(clk),
 	FUNCTION(clk12),
 	FUNCTION(cpu),
+	FUNCTION(csi),
 	FUNCTION(dap),
 	FUNCTION(dap1),
 	FUNCTION(dap2),
@@ -1638,6 +1639,7 @@ static struct tegra_function tegra124_functions[] = {
 	FUNCTION(displaya_alt),
 	FUNCTION(displayb),
 	FUNCTION(dp),
+	FUNCTION(dsi_b),
 	FUNCTION(dtv),
 	FUNCTION(extperiph1),
 	FUNCTION(extperiph2),
@@ -1707,15 +1709,15 @@ static struct tegra_function tegra124_functions[] = {
 	FUNCTION(vi_alt3),
 	FUNCTION(vimclk2),
 	FUNCTION(vimclk2_alt),
-	FUNCTION(csi),
-	FUNCTION(dsi_b),
 };
 
 #define DRV_PINGROUP_REG_A		0x868	/* bank 0 */
 #define PINGROUP_REG_A			0x3000	/* bank 1 */
 #define MIPI_PAD_CTRL_PINGROUP_REG_A	0x820	/* bank 2 */
 
+#define DRV_PINGROUP_REG(r)		((r) - DRV_PINGROUP_REG_A)
 #define PINGROUP_REG(r)			((r) - PINGROUP_REG_A)
+#define MIPI_PAD_CTRL_PINGROUP_REG_Y(r)	((r) - MIPI_PAD_CTRL_PINGROUP_REG_A)
 
 #define PINGROUP_BIT_Y(b)		(b)
 #define PINGROUP_BIT_N(b)		(-1)
@@ -1740,20 +1742,17 @@ static struct tegra_function tegra124_functions[] = {
 		.tri_reg = PINGROUP_REG(r),				\
 		.tri_bank = 1,						\
 		.tri_bit = 4,						\
-		.einput_bit = PINGROUP_BIT_Y(5),			\
+		.einput_bit = 5,					\
 		.odrain_bit = PINGROUP_BIT_##od(6),			\
-		.lock_bit = PINGROUP_BIT_Y(7),				\
+		.lock_bit = 7,						\
 		.ioreset_bit = PINGROUP_BIT_##ior(8),			\
 		.rcv_sel_bit = PINGROUP_BIT_##rcv_sel(9),		\
 		.drv_reg = -1,						\
 	}
 
-#define DRV_PINGROUP_REG(r)		((r) - DRV_PINGROUP_REG_A)
-
-#define DRV_PINGROUP(pg_name, r, hsm_b, schmitt_b, lpmd_b,		\
-		     drvdn_b, drvdn_w, drvup_b, drvup_w,		\
-		     slwr_b, slwr_w, slwf_b, slwf_w,			\
-		     drvtype)						\
+#define DRV_PINGROUP(pg_name, r, hsm_b, schmitt_b, lpmd_b, drvdn_b,	\
+		     drvdn_w, drvup_b, drvup_w, slwr_b, slwr_w,		\
+		     slwf_b, slwf_w, drvtype)				\
 	{								\
 		.name = "drive_" #pg_name,				\
 		.pins = drive_##pg_name##_pins,				\
@@ -1782,8 +1781,6 @@ static struct tegra_function tegra124_functions[] = {
 		.drvtype_bit = PINGROUP_BIT_##drvtype(6),		\
 	}
 
-#define MIPI_PAD_CTRL_PINGROUP_REG_Y(r)	((r) - MIPI_PAD_CTRL_PINGROUP_REG_A)
-
 #define MIPI_PAD_CTRL_PINGROUP(pg_name, r, b, f0, f1)			\
 	{								\
 		.name = "mipi_pad_ctrl_" #pg_name,			\
@@ -2044,8 +2041,8 @@ static const struct tegra_pingroup tegra124_groups[] = {
 	DRV_PINGROUP(sdio4,       0x9c4,  2,  3,  4,  12,  5,  20,  5,  28,  2,  30,  2,  N),
 	DRV_PINGROUP(ao4,         0x9c8,  2,  3,  4,  12,  7,  20,  7,  28,  2,  30,  2,  Y),
 
-	/*		       pg_name, r      b  f0,  f1 */
-	MIPI_PAD_CTRL_PINGROUP(dsi_b,   0x820, 1, CSI, DSI_B)
+	/*                     pg_name, r,     b, f0,  f1 */
+	MIPI_PAD_CTRL_PINGROUP(dsi_b,   0x820, 1, CSI, DSI_B),
 };
 
 static const struct tegra_pinctrl_soc_data tegra124_pinctrl = {
diff --git a/drivers/pinctrl/pinctrl-tegra30.c b/drivers/pinctrl/pinctrl-tegra30.c
index f6edc2ff5494..77c0768d5bd8 100644
--- a/drivers/pinctrl/pinctrl-tegra30.c
+++ b/drivers/pinctrl/pinctrl-tegra30.c
@@ -2108,70 +2108,69 @@ static struct tegra_function tegra30_functions[] = {
 #define DRV_PINGROUP_REG_A		0x868	/* bank 0 */
 #define PINGROUP_REG_A			0x3000	/* bank 1 */
 
+#define DRV_PINGROUP_REG(r)		((r) - DRV_PINGROUP_REG_A)
 #define PINGROUP_REG(r)			((r) - PINGROUP_REG_A)
 
 #define PINGROUP_BIT_Y(b)		(b)
 #define PINGROUP_BIT_N(b)		(-1)
 
-#define PINGROUP(pg_name, f0, f1, f2, f3, r, od, ior)		\
-	{							\
-		.name = #pg_name,				\
-		.pins = pg_name##_pins,				\
-		.npins = ARRAY_SIZE(pg_name##_pins),		\
-		.funcs = {					\
-			TEGRA_MUX_##f0,				\
-			TEGRA_MUX_##f1,				\
-			TEGRA_MUX_##f2,				\
-			TEGRA_MUX_##f3,				\
-		},						\
-		.mux_reg = PINGROUP_REG(r),			\
-		.mux_bank = 1,					\
-		.mux_bit = 0,					\
-		.pupd_reg = PINGROUP_REG(r),			\
-		.pupd_bank = 1,					\
-		.pupd_bit = 2,					\
-		.tri_reg = PINGROUP_REG(r),			\
-		.tri_bank = 1,					\
-		.tri_bit = 4,					\
-		.einput_bit = PINGROUP_BIT_Y(5),		\
-		.odrain_bit = PINGROUP_BIT_##od(6),		\
-		.lock_bit = PINGROUP_BIT_Y(7),			\
-		.ioreset_bit = PINGROUP_BIT_##ior(8),		\
-		.rcv_sel_bit = -1,				\
-		.drv_reg = -1,					\
+#define PINGROUP(pg_name, f0, f1, f2, f3, r, od, ior)			\
+	{								\
+		.name = #pg_name,					\
+		.pins = pg_name##_pins,					\
+		.npins = ARRAY_SIZE(pg_name##_pins),			\
+		.funcs = {						\
+			TEGRA_MUX_##f0,					\
+			TEGRA_MUX_##f1,					\
+			TEGRA_MUX_##f2,					\
+			TEGRA_MUX_##f3,					\
+		},							\
+		.mux_reg = PINGROUP_REG(r),				\
+		.mux_bank = 1,						\
+		.mux_bit = 0,						\
+		.pupd_reg = PINGROUP_REG(r),				\
+		.pupd_bank = 1,						\
+		.pupd_bit = 2,						\
+		.tri_reg = PINGROUP_REG(r),				\
+		.tri_bank = 1,						\
+		.tri_bit = 4,						\
+		.einput_bit = 5,					\
+		.odrain_bit = PINGROUP_BIT_##od(6),			\
+		.lock_bit = 7,						\
+		.ioreset_bit = PINGROUP_BIT_##ior(8),			\
+		.rcv_sel_bit = -1,					\
+		.drv_reg = -1,						\
 	}
 
-#define DRV_PINGROUP_REG(r)		((r) - DRV_PINGROUP_REG_A)
-
-#define DRV_PINGROUP(pg_name, r, hsm_b, schmitt_b, lpmd_b,	\
-		     drvdn_b, drvdn_w, drvup_b, drvup_w,	\
-		     slwr_b, slwr_w, slwf_b, slwf_w)		\
-	{							\
-		.name = "drive_" #pg_name,			\
-		.pins = drive_##pg_name##_pins,			\
-		.npins = ARRAY_SIZE(drive_##pg_name##_pins),	\
-		.mux_reg = -1,					\
-		.pupd_reg = -1,					\
-		.tri_reg = -1,					\
-		.einput_bit = -1,				\
-		.odrain_bit = -1,				\
-		.lock_bit = -1,					\
-		.ioreset_bit = -1,				\
-		.rcv_sel_bit = -1,				\
-		.drv_reg = DRV_PINGROUP_REG(r),			\
-		.drv_bank = 0,					\
-		.hsm_bit = hsm_b,				\
-		.schmitt_bit = schmitt_b,			\
-		.lpmd_bit = lpmd_b,				\
-		.drvdn_bit = drvdn_b,				\
-		.drvdn_width = drvdn_w,				\
-		.drvup_bit = drvup_b,				\
-		.drvup_width = drvup_w,				\
-		.slwr_bit = slwr_b,				\
-		.slwr_width = slwr_w,				\
-		.slwf_bit = slwf_b,				\
-		.slwf_width = slwf_w,				\
-		.drvtype_bit = -1,				\
+#define DRV_PINGROUP(pg_name, r, hsm_b, schmitt_b, lpmd_b, drvdn_b,	\
+		     drvdn_w, drvup_b, drvup_w, slwr_b, slwr_w,		\
+		     slwf_b, slwf_w)					\
+	{								\
+		.name = "drive_" #pg_name,				\
+		.pins = drive_##pg_name##_pins,				\
+		.npins = ARRAY_SIZE(drive_##pg_name##_pins),		\
+		.mux_reg = -1,						\
+		.pupd_reg = -1,						\
+		.tri_reg = -1,						\
+		.einput_bit = -1,					\
+		.odrain_bit = -1,					\
+		.lock_bit = -1,						\
+		.ioreset_bit = -1,					\
+		.rcv_sel_bit = -1,					\
+		.drv_reg = DRV_PINGROUP_REG(r),				\
+		.drv_bank = 0,						\
+		.hsm_bit = hsm_b,					\
+		.schmitt_bit = schmitt_b,				\
+		.lpmd_bit = lpmd_b,					\
+		.drvdn_bit = drvdn_b,					\
+		.drvdn_width = drvdn_w,					\
+		.drvup_bit = drvup_b,					\
+		.drvup_width = drvup_w,					\
+		.slwr_bit = slwr_b,					\
+		.slwr_width = slwr_w,					\
+		.slwf_bit = slwf_b,					\
+		.slwf_width = slwf_w,					\
+		.drvtype_bit = -1,					\
 	}
 
 static const struct tegra_pingroup tegra30_groups[] = {
-- 
1.9.1
