From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH V2 2/5] ARM: tegra: set up audio clocks for tegra30 dt
Date: Tue, 10 Apr 2012 17:19:37 -0600
Message-ID: <1334099980-19527-2-git-send-email-swarren@wwwdotorg.org>
References: <1334099980-19527-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1334099980-19527-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Set up the audio clock tree for Tegra30 in an equivalent fashion to the
existing setup for Tegra20.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/board-dt-tegra30.c |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-tegra/board-dt-tegra30.c b/arch/arm/mach-tegra/board-dt-tegra30.c
index 5f7c03e..3de21c0 100644
--- a/arch/arm/mach-tegra/board-dt-tegra30.c
+++ b/arch/arm/mach-tegra/board-dt-tegra30.c
@@ -57,6 +57,15 @@ struct of_dev_auxdata tegra30_auxdata_lookup[] __initdata = {
 static __initdata struct tegra_clk_init_table tegra_dt_clk_init_table[] = {
 	/* name		parent		rate		enabled */
 	{ "uarta",	"pll_p",	408000000,	true },
+	{ "pll_a",	"pll_p_out1",	564480000,	true },
+	{ "pll_a_out0",	"pll_a",	11289600,	true },
+	{ "extern1",	"pll_a_out0",	0,		true },
+	{ "clk_out_1",	"extern1",	0,		true },
+	{ "i2s0",	"pll_a_out0",	11289600,	false},
+	{ "i2s1",	"pll_a_out0",	11289600,	false},
+	{ "i2s2",	"pll_a_out0",	11289600,	false},
+	{ "i2s3",	"pll_a_out0",	11289600,	false},
+	{ "i2s4",	"pll_a_out0",	11289600,	false},
 	{ NULL,		NULL,		0,		0},
 };
 
-- 
1.7.0.4
