From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] ARM: tegra: fix pclk rate
Date: Tue, 24 Apr 2012 11:50:18 -0600
Message-ID: <1335289818-21812-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Commit 40f9cf0 "ARM: tegra: reparent sclk to pll_c_out1" changed the
rate of hclk. Since pclk is derived from that, and only has integer
dividers, the pclk rate needs to change in the same fashion, from 54MHz
to 60MHz.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/common.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-tegra/common.c b/arch/arm/mach-tegra/common.c
index 654a457..2d80566 100644
--- a/arch/arm/mach-tegra/common.c
+++ b/arch/arm/mach-tegra/common.c
@@ -87,7 +87,7 @@ static __initdata struct tegra_clk_init_table tegra20_clk_init_table[] = {
 	{ "pll_c_out1",	"pll_c",	120000000,	true },
 	{ "sclk",	"pll_c_out1",	120000000,	true },
 	{ "hclk",	"sclk",		120000000,	true },
-	{ "pclk",	"hclk",		54000000,	true },
+	{ "pclk",	"hclk",		60000000,	true },
 	{ "csite",	NULL,		0,		true },
 	{ "emc",	NULL,		0,		true },
 	{ "cpu",	NULL,		0,		true },
-- 
1.7.0.4
