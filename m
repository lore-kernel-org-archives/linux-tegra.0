From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/4] dt-bindings: clock: tegra: Add sor1_out clock
Date: Fri,  1 Sep 2017 16:53:40 +0200
Message-ID: <20170901145343.19890-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The sor1_src clock implemented on Tegra210 is modelled the wrong way
around, which causes some issues with HDMI and DP support. This clock
implementation is provided by BPMP on Tegra186, which models this in
a more correct way. Since this introduces incompatibilities between
the two SoC generations which we want to avoid, the Tegra210 will be
fixed in subsequent patches.

This change adds sor1_out as an alias for sor1_src.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 include/dt-bindings/clock/tegra210-car.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/tegra210-car.h b/include/dt-bindings/clock/tegra210-car.h
index 46689cd3750b..43c4a8407333 100644
--- a/include/dt-bindings/clock/tegra210-car.h
+++ b/include/dt-bindings/clock/tegra210-car.h
@@ -309,6 +309,7 @@
 #define TEGRA210_CLK_BLINK 280
 /* 281 */
 #define TEGRA210_CLK_SOR1_SRC 282
+#define TEGRA210_CLK_SOR1_OUT 282
 /* 283 */
 #define TEGRA210_CLK_XUSB_HOST_SRC 284
 #define TEGRA210_CLK_XUSB_FALCON_SRC 285
-- 
2.13.3
