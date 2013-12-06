From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/2] pinctrl: tegra: Various Tegra124 fixes
Date: Fri,  6 Dec 2013 12:53:58 +0100
Message-ID: <1386330839-30559-1-git-send-email-treding@nvidia.com>
References: <52A10C7B.8070406@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52A10C7B.8070406-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Remove various gratuitous blank lines and other minor whitespace and
style cleanups. Add some missing commas within group arrays to prevent
the compiler from concatenating the strings. Remove unneeded
TEGRA_MUX_SAFE entry from enumeration and drop gratuitous _dt suffix
from tegra_mux enumeration type name. Drop an unwarranted FIXME comment
and rename gmi_ad8_ph0 pin to ph0 since that's how it's referenced in
the DS06472001 datasheet.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/pinctrl/pinctrl-tegra124.c | 27 ++++++++-------------------
 1 file changed, 8 insertions(+), 19 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-tegra124.c b/drivers/pinctrl/pinctrl-tegra124.c
index 592fd6f079b6..632e076115d5 100644
--- a/drivers/pinctrl/pinctrl-tegra124.c
+++ b/drivers/pinctrl/pinctrl-tegra124.c
@@ -211,7 +211,6 @@
 #define TEGRA_PIN_USB_VBUS_EN2_PFF1		_GPIO(249)
 #define TEGRA_PIN_PFF2				_GPIO(250)
 
-
 /* All non-GPIO pins follow */
 #define NUM_GPIOS	(TEGRA_PIN_PFF2 + 1)
 #define _PIN(offset)	(NUM_GPIOS + (offset))
@@ -1183,8 +1182,6 @@ static const unsigned jtag_rtck_pins[] = {
 	TEGRA_PIN_JTAG_RTCK,
 };
 
-
-/*FIXME */
 static const unsigned drive_ao1_pins[] = {
 	TEGRA_PIN_KB_ROW0_PR0,
 	TEGRA_PIN_KB_ROW1_PR1,
@@ -1242,7 +1239,7 @@ static const unsigned drive_at2_pins[] = {
 	TEGRA_PIN_PG6,
 	TEGRA_PIN_PG7,
 	TEGRA_PIN_PI0,
-	TEGRA_PIN_PI0,
+	TEGRA_PIN_PI1,
 	TEGRA_PIN_PI3,
 	TEGRA_PIN_PI4,
 	TEGRA_PIN_PI7,
@@ -1497,8 +1494,7 @@ static const unsigned drive_ao4_pins[] = {
 	TEGRA_PIN_JTAG_RTCK,
 };
 
-enum tegra_mux_dt {
-	TEGRA_MUX_SAFE,
+enum tegra_mux {
 	TEGRA_MUX_BLINK,
 	TEGRA_MUX_CEC,
 	TEGRA_MUX_CLDVFS,
@@ -1771,7 +1767,6 @@ static const char * const gmi_groups[] = {
 	"sdmmc4_clk_pcc4",
 	"sdmmc4_cmd_pt7",
 	"gmi_clk_lb",
-	"gpio_x6_aud_px6",
 
 	"dap1_fs_pn0",
 	"dap1_din_pn1",
@@ -1888,7 +1883,7 @@ static const char * const irda_groups[] = {
 	"uart2_rxd_pc3",
 	"uart2_txd_pc2",
 	"kb_row11_ps3",
-	"kb_row12_ps4"
+	"kb_row12_ps4",
 };
 
 static const char * const kbc_groups[] = {
@@ -1936,7 +1931,7 @@ static const char * const pwm0_groups[] = {
 	"sdmmc1_dat2_py5",
 	"uart3_rts_n_pc0",
 	"pu3",
-	"gmi_ad8_ph0",
+	"ph0",
 	"sdmmc3_dat3_pb4",
 };
 
@@ -2001,8 +1996,6 @@ static const char * const rsvd1_groups[] = {
 	"reset_out_n",
 };
 
-
-
 static const char * const rsvd2_groups[] = {
 	"pv0",
 	"pv1",
@@ -2194,7 +2187,7 @@ static const char * const rsvd4_groups[] = {
 	"dap3_dout_pp2",
 	"pv0",
 	"pv1",
-	"sdmmc1_clk_pz0"
+	"sdmmc1_clk_pz0",
 
 	"clk2_out_pw5",
 	"clk2_req_pcc5",
@@ -2305,7 +2298,7 @@ static const char * const rsvd4_groups[] = {
 	"usb_vbus_en1_pn5",
 	"sdmmc3_clk_lb_out_pee4",
 	"sdmmc3_clk_lb_in_pee5",
-	"gmi_clk_lb"
+	"gmi_clk_lb",
 
 	"dp_hpd_pff0",
 	"usb_vbus_en2_pff1",
@@ -2313,7 +2306,6 @@ static const char * const rsvd4_groups[] = {
 };
 
 static const char * const sdmmc1_groups[] = {
-
 	"sdmmc1_clk_pz0",
 	"sdmmc1_cmd_pz1",
 	"sdmmc1_dat3_py4",
@@ -2700,7 +2692,7 @@ static const char * const tmds_groups[] = {
 		.ngroups = ARRAY_SIZE(fname##_groups),	\
 	}
 
-static const struct tegra_function  tegra124_functions[] = {
+static const struct tegra_function tegra124_functions[] = {
 	FUNCTION(blink),
 	FUNCTION(cec),
 	FUNCTION(cldvfs),
@@ -3105,7 +3097,6 @@ static const struct tegra_pingroup tegra124_groups[] = {
 	DRV_PINGROUP(hv0,   0x9b4,  2,  3,  4,  12,  5,  -1,  -1,  28,  2,  -1,  -1,  N),
 	DRV_PINGROUP(sdio4, 0x9c4,  2,  3,  4,  12,  5,  20,  5,  28,  2,  30,  2,  N),
 	DRV_PINGROUP(ao4,   0x9c8,  2,  3,  4,  12,  7,  20,  7,  28,  2,  30,  2,  Y),
-
 };
 
 static const struct tegra_pinctrl_soc_data tegra124_pinctrl = {
@@ -3127,6 +3118,7 @@ static struct of_device_id tegra124_pinctrl_of_match[] = {
 	{ .compatible = "nvidia,tegra124-pinmux", },
 	{ },
 };
+MODULE_DEVICE_TABLE(of, tegra124_pinctrl_of_match);
 
 static struct platform_driver tegra124_pinctrl_driver = {
 	.driver = {
@@ -3137,11 +3129,8 @@ static struct platform_driver tegra124_pinctrl_driver = {
 	.probe = tegra124_pinctrl_probe,
 	.remove = tegra_pinctrl_remove,
 };
-
 module_platform_driver(tegra124_pinctrl_driver);
 
 MODULE_AUTHOR("Ashwini Ghuge <aghuge-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>");
 MODULE_DESCRIPTION("NVIDIA Tegra124 pinctrl driver");
 MODULE_LICENSE("GPL v2");
-MODULE_DEVICE_TABLE(of, tegra124_pinctrl_of_match);
-
-- 
1.8.4.2
