From: Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Subject: [GIT PULL v2 2/3] ARM: tegra: trimslice: add audio devices and clocks
Date: Mon, 16 May 2011 23:22:35 +0300
Message-ID: <27623d27d5d3c11a745e93a238fb38aef54ea364.1305576864.git.mike@compulab.co.il>
References: <cover.1305576864.git.mike@compulab.co.il>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1305576864.git.mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Signed-off-by: Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
---
 arch/arm/mach-tegra/board-trimslice-pinmux.c |    2 +-
 arch/arm/mach-tegra/board-trimslice.c        |   13 +++++++++++++
 2 files changed, 14 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-tegra/board-trimslice-pinmux.c b/arch/arm/mach-tegra/board-trimslice-pinmux.c
index 13534fa..321c610 100644
--- a/arch/arm/mach-tegra/board-trimslice-pinmux.c
+++ b/arch/arm/mach-tegra/board-trimslice-pinmux.c
@@ -29,7 +29,7 @@ static __initdata struct tegra_pingroup_config trimslice_pinmux[] = {
 	{TEGRA_PINGROUP_ATC,   TEGRA_MUX_NAND,          TEGRA_PUPD_NORMAL,	TEGRA_TRI_TRISTATE},
 	{TEGRA_PINGROUP_ATD,   TEGRA_MUX_GMI,           TEGRA_PUPD_NORMAL,	TEGRA_TRI_TRISTATE},
 	{TEGRA_PINGROUP_ATE,   TEGRA_MUX_GMI,           TEGRA_PUPD_NORMAL,	TEGRA_TRI_TRISTATE},
-	{TEGRA_PINGROUP_CDEV1, TEGRA_MUX_OSC,           TEGRA_PUPD_NORMAL,      TEGRA_TRI_NORMAL},
+	{TEGRA_PINGROUP_CDEV1, TEGRA_MUX_PLLA_OUT,      TEGRA_PUPD_NORMAL,      TEGRA_TRI_NORMAL},
 	{TEGRA_PINGROUP_CDEV2, TEGRA_MUX_PLLP_OUT4,     TEGRA_PUPD_PULL_DOWN,   TEGRA_TRI_TRISTATE},
 	{TEGRA_PINGROUP_CRTP,  TEGRA_MUX_CRT,           TEGRA_PUPD_NORMAL,      TEGRA_TRI_TRISTATE},
 	{TEGRA_PINGROUP_CSUS,  TEGRA_MUX_VI_SENSOR_CLK, TEGRA_PUPD_PULL_DOWN,   TEGRA_TRI_TRISTATE},
diff --git a/arch/arm/mach-tegra/board-trimslice.c b/arch/arm/mach-tegra/board-trimslice.c
index dcf5fc5..a19e90b 100644
--- a/arch/arm/mach-tegra/board-trimslice.c
+++ b/arch/arm/mach-tegra/board-trimslice.c
@@ -73,10 +73,19 @@ static struct tegra_sdhci_platform_data sdhci_pdata4 = {
 	.power_gpio	= -1,
 };
 
+static struct platform_device trimslice_audio_device = {
+	.name	= "tegra-snd-trimslice",
+	.id	= 0,
+};
+
 static struct platform_device *trimslice_devices[] __initdata = {
 	&debug_uart,
 	&tegra_sdhci_device1,
 	&tegra_sdhci_device4,
+	&tegra_i2s_device1,
+	&tegra_das_device,
+	&tegra_pcm_device,
+	&trimslice_audio_device,
 };
 
 static struct tegra_i2c_platform_data trimslice_i2c1_platform_data = {
@@ -127,6 +136,10 @@ static void __init tegra_trimslice_fixup(struct machine_desc *desc,
 static __initdata struct tegra_clk_init_table trimslice_clk_init_table[] = {
 	/* name		parent		rate		enabled */
 	{ "uarta",	"pll_p",	216000000,	true },
+	{ "pll_a",	"pll_p_out1",	56448000,	true },
+	{ "pll_a_out0",	"pll_a",	11289600,	true },
+	{ "cdev1",	NULL,		0,		true },
+	{ "i2s1",	"pll_a_out0",	11289600,	false},
 	{ NULL,		NULL,		0,		0},
 };
 
-- 
1.7.3.1
