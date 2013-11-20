From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 2/5] clk: tegra: remove some redundant defines from Tegra114
Date: Wed, 20 Nov 2013 16:47:19 -0700
Message-ID: <1384991242-13596-2-git-send-email-swarren@wwwdotorg.org>
References: <1384991242-13596-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1384991242-13596-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

These #defines aren't used. Delete them.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
This probably should be squashed into commit 32721a734a3d "clk: tegra:
move PMC, fixed clocks to common files".
---
 drivers/clk/tegra/clk-tegra114.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
index 9036a22ee5aa..70bfefebcca5 100644
--- a/drivers/clk/tegra/clk-tegra114.c
+++ b/drivers/clk/tegra/clk-tegra114.c
@@ -107,13 +107,6 @@
 #define PLLC_OUT 0x84
 #define PLLM_OUT 0x94
 
-#define PMC_CLK_OUT_CNTRL 0x1a8
-#define PMC_DPD_PADS_ORIDE 0x1c
-#define PMC_DPD_PADS_ORIDE_BLINK_ENB 20
-#define PMC_CTRL 0
-#define PMC_CTRL_BLINK_ENB 7
-#define PMC_BLINK_TIMER 0x40
-
 #define OSC_CTRL			0x50
 #define OSC_CTRL_OSC_FREQ_SHIFT		28
 #define OSC_CTRL_PLL_REF_DIV_SHIFT	26
-- 
1.8.1.5
