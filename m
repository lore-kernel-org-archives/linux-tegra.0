From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v4 01/15] ARM: tegra30: add missing CLK IDs
Date: Thu, 17 Oct 2013 15:38:32 +0300
Message-ID: <1382013526-12800-2-git-send-email-pdeschrijver@nvidia.com>
References: <1382013526-12800-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1382013526-12800-1-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The Tegra30 clock bindings lack few IDs for audio and clk_out muxes.

Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 include/dt-bindings/clock/tegra30-car.h |   10 +++++++++-
 1 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/include/dt-bindings/clock/tegra30-car.h b/include/dt-bindings/clock/tegra30-car.h
index e40fae8..2244582 100644
--- a/include/dt-bindings/clock/tegra30-car.h
+++ b/include/dt-bindings/clock/tegra30-car.h
@@ -260,6 +260,14 @@
 /* 298 */
 /* 299 */
 #define TEGRA30_CLK_CLK_OUT_1_MUX 300
-#define TEGRA30_CLK_CLK_MAX 301
+#define TEGRA30_CLK_CLK_OUT_2_MUX 301
+#define TEGRA30_CLK_CLK_OUT_3_MUX 302
+#define TEGRA30_CLK_AUDIO0_MUX 303
+#define TEGRA30_CLK_AUDIO1_MUX 304
+#define TEGRA30_CLK_AUDIO2_MUX 305
+#define TEGRA30_CLK_AUDIO3_MUX 306
+#define TEGRA30_CLK_AUDIO4_MUX 307
+#define TEGRA30_CLK_SPDIF_MUX 308
+#define TEGRA30_CLK_CLK_MAX 309
 
 #endif	/* _DT_BINDINGS_CLOCK_TEGRA30_CAR_H */
-- 
1.7.7.rc0.72.g4b5ea.dirty
