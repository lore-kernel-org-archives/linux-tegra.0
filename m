From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 4/5] clk: tegra: remove some redunant defines from Tegra20
Date: Wed, 20 Nov 2013 16:47:21 -0700
Message-ID: <1384991242-13596-4-git-send-email-swarren@wwwdotorg.org>
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
This probably should be squashed into commit 776b2c0ba0dd "clk: tegra:
move tegra20 to common infra".
---
 drivers/clk/tegra/clk-tegra20.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegra20.c
index 58faac5f509e..be5bdbab78a6 100644
--- a/drivers/clk/tegra/clk-tegra20.c
+++ b/drivers/clk/tegra/clk-tegra20.c
@@ -118,12 +118,6 @@
 
 #define AUDIO_SYNC_CLK 0x38
 
-#define PMC_CTRL 0x0
-#define PMC_CTRL_BLINK_ENB 7
-#define PMC_DPD_PADS_ORIDE 0x1c
-#define PMC_DPD_PADS_ORIDE_BLINK_ENB 20
-#define PMC_BLINK_TIMER 0x40
-
 /* Tegra CPU clock and reset control regs */
 #define TEGRA_CLK_RST_CONTROLLER_CLK_CPU_CMPLX		0x4c
 #define TEGRA_CLK_RST_CONTROLLER_RST_CPU_CMPLX_SET	0x340
-- 
1.8.1.5
