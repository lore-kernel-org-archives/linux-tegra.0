From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH V2 1/5] ARM: tegra: provide clock aliases for AHUB configlink
Date: Tue, 10 Apr 2012 17:19:36 -0600
Message-ID: <1334099980-19527-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The Tegra30 AHUB driver must call tegra_periph_reset_deassert() for all
devices on the AHUB's configlink bus. The AHUB driver must be able to
call clk_get_sys() to retrieve the clock parameter for this function.
Add the necessary clock aliases to allow this.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/tegra30_clocks.c |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-tegra/tegra30_clocks.c b/arch/arm/mach-tegra/tegra30_clocks.c
index 6d08b53..e33fe4b 100644
--- a/arch/arm/mach-tegra/tegra30_clocks.c
+++ b/arch/arm/mach-tegra/tegra30_clocks.c
@@ -3015,6 +3015,15 @@ struct clk_duplicate tegra_clk_duplicates[] = {
 	CLK_DUPLICATE("sbc6", "spi_slave_tegra.5", NULL),
 	CLK_DUPLICATE("twd", "smp_twd", NULL),
 	CLK_DUPLICATE("vcp", "nvavp", "vcp"),
+	CLK_DUPLICATE("i2s0", NULL, "i2s0"),
+	CLK_DUPLICATE("i2s1", NULL, "i2s1"),
+	CLK_DUPLICATE("i2s2", NULL, "i2s2"),
+	CLK_DUPLICATE("i2s3", NULL, "i2s3"),
+	CLK_DUPLICATE("i2s4", NULL, "i2s4"),
+	CLK_DUPLICATE("dam0", NULL, "dam0"),
+	CLK_DUPLICATE("dam1", NULL, "dam1"),
+	CLK_DUPLICATE("dam2", NULL, "dam2"),
+	CLK_DUPLICATE("spdif_in", NULL, "spdif_in"),
 };
 
 struct clk *tegra_ptr_clks[] = {
-- 
1.7.0.4
