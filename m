From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: =?UTF-8?q?=5BPATCH=201/7=5D=20ARM=3A=20tegra=3A=20add=20ac97=20clock?=
Date: Thu, 20 Dec 2012 00:17:30 +0100
Message-ID: <1355959056-6009-1-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org
Cc: patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Add clock used by the AC97 host controller.

Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
---
 arch/arm/mach-tegra/board-dt-tegra20.c    | 2 ++
 arch/arm/mach-tegra/tegra20_clocks_data.c | 2 ++
 2 Dateien ge=C3=A4ndert, 4 Zeilen hinzugef=C3=BCgt(+)

diff --git a/arch/arm/mach-tegra/board-dt-tegra20.c b/arch/arm/mach-teg=
ra/board-dt-tegra20.c
index 734d9cc..acff2bd 100644
--- a/arch/arm/mach-tegra/board-dt-tegra20.c
+++ b/arch/arm/mach-tegra/board-dt-tegra20.c
@@ -78,6 +78,7 @@ struct of_dev_auxdata tegra20_auxdata_lookup[] __init=
data =3D {
 	OF_DEV_AUXDATA("nvidia,tegra20-i2c", TEGRA_I2C2_BASE, "tegra-i2c.1", =
NULL),
 	OF_DEV_AUXDATA("nvidia,tegra20-i2c", TEGRA_I2C3_BASE, "tegra-i2c.2", =
NULL),
 	OF_DEV_AUXDATA("nvidia,tegra20-i2c-dvc", TEGRA_DVC_BASE, "tegra-i2c.3=
", NULL),
+	OF_DEV_AUXDATA("nvidia,tegra20-ac97", TEGRA_AC97_BASE, "tegra20-ac97"=
, NULL),
 	OF_DEV_AUXDATA("nvidia,tegra20-i2s", TEGRA_I2S1_BASE, "tegra20-i2s.0"=
, NULL),
 	OF_DEV_AUXDATA("nvidia,tegra20-i2s", TEGRA_I2S2_BASE, "tegra20-i2s.1"=
, NULL),
 	OF_DEV_AUXDATA("nvidia,tegra20-das", TEGRA_APB_MISC_DAS_BASE, "tegra2=
0-das", NULL),
@@ -114,6 +115,7 @@ static __initdata struct tegra_clk_init_table tegra=
_dt_clk_init_table[] =3D {
 	{ "pll_a_out0", "pll_a",        11289600,       true },
 	{ "cdev1",      NULL,           0,              true },
 	{ "blink",      "clk_32k",      32768,          true },
+	{ "ac97",       "pll_a_out0",   24576000,       false},
 	{ "i2s1",       "pll_a_out0",   11289600,       false},
 	{ "i2s2",       "pll_a_out0",   11289600,       false},
 	{ "sdmmc1",	"pll_p",	48000000,	false},
diff --git a/arch/arm/mach-tegra/tegra20_clocks_data.c b/arch/arm/mach-=
tegra/tegra20_clocks_data.c
index a23a073..33f1230 100644
--- a/arch/arm/mach-tegra/tegra20_clocks_data.c
+++ b/arch/arm/mach-tegra/tegra20_clocks_data.c
@@ -891,6 +891,7 @@ DEFINE_CLK_TEGRA(emc, 0, &tegra_emc_clk_ops, 0, mux=
_pllm_pllc_pllp_clkm,
 PERIPH_CLK(apbdma,	"tegra-apbdma",		NULL,	34,	0,	108000000, mux_pclk,	=
		0);
 PERIPH_CLK(rtc,		"rtc-tegra",		NULL,	4,	0,	32768,     mux_clk_32k,			P=
ERIPH_NO_RESET);
 PERIPH_CLK(timer,	"timer",		NULL,	5,	0,	26000000,  mux_clk_m,			0);
+PERIPH_CLK(ac97,	"tegra20-ac97",		NULL,	3,	0,	26000000,  mux_pllaout0_=
audio2x_pllp_clkm,	DIV_U71);
 PERIPH_CLK(i2s1,	"tegra20-i2s.0",	NULL,	11,	0x100,	26000000,  mux_plla=
out0_audio2x_pllp_clkm,	MUX | DIV_U71);
 PERIPH_CLK(i2s2,	"tegra20-i2s.1",	NULL,	18,	0x104,	26000000,  mux_plla=
out0_audio2x_pllp_clkm,	MUX | DIV_U71);
 PERIPH_CLK(spdif_out,	"spdif_out",		NULL,	10,	0x108,	100000000, mux_pl=
laout0_audio2x_pllp_clkm,	MUX | DIV_U71);
@@ -957,6 +958,7 @@ static struct clk *tegra_list_clks[] =3D {
 	&tegra_apbdma,
 	&tegra_rtc,
 	&tegra_timer,
+	&tegra_ac97,
 	&tegra_i2s1,
 	&tegra_i2s2,
 	&tegra_spdif_out,
--=20
1.7.11.7
