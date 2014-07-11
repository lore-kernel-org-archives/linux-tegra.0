From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 3/8] ARM: tegra: Add PLL_M_UD and PLL_C_UD to tegra124-car binding header
Date: Fri, 11 Jul 2014 17:18:28 +0300
Message-ID: <1405088313-20048-4-git-send-email-mperttunen@nvidia.com>
References: <1405088313-20048-1-git-send-email-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1405088313-20048-1-git-send-email-mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add these clocks to the binding header so that EMC timings that have
them as parent can refer to the clocks.

Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 include/dt-bindings/clock/tegra124-car.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/clock/tegra124-car.h b/include/dt-bindings/clock/tegra124-car.h
index 4faabce..f58b24d 100644
--- a/include/dt-bindings/clock/tegra124-car.h
+++ b/include/dt-bindings/clock/tegra124-car.h
@@ -337,6 +337,10 @@
 #define TEGRA124_CLK_DSIB_MUX 310
 #define TEGRA124_CLK_SOR0_LVDS 311
 #define TEGRA124_CLK_XUSB_SS_DIV2 312
-#define TEGRA124_CLK_CLK_MAX 313
+
+#define TEGRA124_CLK_PLL_M_UD 313
+#define TEGRA124_CLK_PLL_C_UD 314
+
+#define TEGRA124_CLK_CLK_MAX 315
 
 #endif	/* _DT_BINDINGS_CLOCK_TEGRA124_CAR_H */
-- 
1.8.1.5
