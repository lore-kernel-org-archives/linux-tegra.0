From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [PATCH v5 07/16] ARM: tegra: Provide clock for only one PWM controller
Date: Wed, 28 Mar 2012 16:33:49 +0200
Message-ID: <1332945238-14897-8-git-send-email-thierry.reding@avionic-design.de>
References: <1332945238-14897-1-git-send-email-thierry.reding@avionic-design.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1332945238-14897-1-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Ryan Mallon <rmallon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bernhard Walle <walle-pDveNdigDaDu9UdzE1sIFA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

A subsequent patch will add a generic PWM API driver for the Tegra PWFM
controller, supporting all four PWM devices with a single PWM chip. The
device will be named tegra-pwm and only one clock needs to be provided.

Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Changes in v5:
- rename the device name to "tegra-pwm" in the clock lookup table
- get rid of all CLK_DUPLICATE entries which are no longer needed

 arch/arm/mach-tegra/tegra2_clocks.c  |    6 +-----
 arch/arm/mach-tegra/tegra30_clocks.c |    6 +-----
 2 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/arch/arm/mach-tegra/tegra2_clocks.c b/arch/arm/mach-tegra/tegra2_clocks.c
index 64735bd..c95a878 100644
--- a/arch/arm/mach-tegra/tegra2_clocks.c
+++ b/arch/arm/mach-tegra/tegra2_clocks.c
@@ -2170,7 +2170,7 @@ static struct clk tegra_list_clks[] = {
 	PERIPH_CLK("i2s2",	"tegra-i2s.1",		NULL,	18,	0x104,	26000000,  mux_pllaout0_audio2x_pllp_clkm,	MUX | DIV_U71),
 	PERIPH_CLK("spdif_out",	"spdif_out",		NULL,	10,	0x108,	100000000, mux_pllaout0_audio2x_pllp_clkm,	MUX | DIV_U71),
 	PERIPH_CLK("spdif_in",	"spdif_in",		NULL,	10,	0x10c,	100000000, mux_pllp_pllc_pllm,		MUX | DIV_U71),
-	PERIPH_CLK("pwm",	"pwm",			NULL,	17,	0x110,	432000000, mux_pllp_pllc_audio_clkm_clk32,	MUX | DIV_U71 | MUX_PWM),
+	PERIPH_CLK("pwm",	"tegra-pwm",		NULL,	17,	0x110,	432000000, mux_pllp_pllc_audio_clkm_clk32,	MUX | DIV_U71 | MUX_PWM),
 	PERIPH_CLK("spi",	"spi",			NULL,	43,	0x114,	40000000,  mux_pllp_pllc_pllm_clkm,	MUX | DIV_U71),
 	PERIPH_CLK("xio",	"xio",			NULL,	45,	0x120,	150000000, mux_pllp_pllc_pllm_clkm,	MUX | DIV_U71),
 	PERIPH_CLK("twc",	"twc",			NULL,	16,	0x12c,	150000000, mux_pllp_pllc_pllm_clkm,	MUX | DIV_U71),
@@ -2269,10 +2269,6 @@ static struct clk_duplicate tegra_clk_duplicates[] = {
 	CLK_DUPLICATE("usbd", "tegra-otg", NULL),
 	CLK_DUPLICATE("hdmi", "tegradc.0", "hdmi"),
 	CLK_DUPLICATE("hdmi", "tegradc.1", "hdmi"),
-	CLK_DUPLICATE("pwm", "tegra_pwm.0", NULL),
-	CLK_DUPLICATE("pwm", "tegra_pwm.1", NULL),
-	CLK_DUPLICATE("pwm", "tegra_pwm.2", NULL),
-	CLK_DUPLICATE("pwm", "tegra_pwm.3", NULL),
 	CLK_DUPLICATE("host1x", "tegra_grhost", "host1x"),
 	CLK_DUPLICATE("2d", "tegra_grhost", "gr2d"),
 	CLK_DUPLICATE("3d", "tegra_grhost", "gr3d"),
diff --git a/arch/arm/mach-tegra/tegra30_clocks.c b/arch/arm/mach-tegra/tegra30_clocks.c
index 6d08b53..18afd0c 100644
--- a/arch/arm/mach-tegra/tegra30_clocks.c
+++ b/arch/arm/mach-tegra/tegra30_clocks.c
@@ -2886,7 +2886,7 @@ struct clk tegra_list_clks[] = {
 	PERIPH_CLK("i2s4",	"tegra30-i2s.4",	NULL,	102,	0x3c0,	26000000,  mux_pllaout0_audio4_2x_pllp_clkm,	MUX | DIV_U71 | PERIPH_ON_APB),
 	PERIPH_CLK("spdif_out",	"tegra30-spdif",	"spdif_out",	10,	0x108,	100000000, mux_pllaout0_audio_2x_pllp_clkm,	MUX | DIV_U71 | PERIPH_ON_APB),
 	PERIPH_CLK("spdif_in",	"tegra30-spdif",	"spdif_in",	10,	0x10c,	100000000, mux_pllp_pllc_pllm,		MUX | DIV_U71 | PERIPH_ON_APB),
-	PERIPH_CLK("pwm",	"pwm",			NULL,	17,	0x110,	432000000, mux_pllp_pllc_clk32_clkm,	MUX | MUX_PWM | DIV_U71 | PERIPH_ON_APB),
+	PERIPH_CLK("pwm",	"tegra-pwm",		NULL,	17,	0x110,	432000000, mux_pllp_pllc_clk32_clkm,	MUX | MUX_PWM | DIV_U71 | PERIPH_ON_APB),
 	PERIPH_CLK("d_audio",	"tegra30-ahub",		"d_audio", 106,	0x3d0,	48000000,  mux_plla_pllc_pllp_clkm,	MUX | DIV_U71),
 	PERIPH_CLK("dam0",	"tegra30-dam.0",	NULL,   108,	0x3d8,	48000000,  mux_plla_pllc_pllp_clkm,	MUX | DIV_U71),
 	PERIPH_CLK("dam1",	"tegra30-dam.1",	NULL,   109,	0x3dc,	48000000,  mux_plla_pllc_pllp_clkm,	MUX | DIV_U71),
@@ -2990,10 +2990,6 @@ struct clk_duplicate tegra_clk_duplicates[] = {
 	CLK_DUPLICATE("hdmi", "tegradc.1", "hdmi"),
 	CLK_DUPLICATE("dsib", "tegradc.0", "dsib"),
 	CLK_DUPLICATE("dsia", "tegradc.1", "dsia"),
-	CLK_DUPLICATE("pwm", "tegra_pwm.0", NULL),
-	CLK_DUPLICATE("pwm", "tegra_pwm.1", NULL),
-	CLK_DUPLICATE("pwm", "tegra_pwm.2", NULL),
-	CLK_DUPLICATE("pwm", "tegra_pwm.3", NULL),
 	CLK_DUPLICATE("bsev", "tegra-avp", "bsev"),
 	CLK_DUPLICATE("bsev", "nvavp", "bsev"),
 	CLK_DUPLICATE("vde", "tegra-aes", "vde"),
-- 
1.7.9.4
