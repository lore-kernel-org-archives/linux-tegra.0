From: Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Subject: [GIT PULL 2/3] ARM: tegra: trimslice: add audio devices and clocks
Date: Wed, 11 May 2011 14:07:39 +0300
Message-ID: <5b474578785d706ff1116299743bc20aa8ef16d5.1305105580.git.mike@compulab.co.il>
References: <cover.1305105580.git.mike@compulab.co.il>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1305105580.git.mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
In-Reply-To: <cover.1305105580.git.mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
References: <cover.1305105580.git.mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Signed-off-by: Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
---
 arch/arm/mach-tegra/board-trimslice.c |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)

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
