From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] clk: tegra: Fix vic03 mux index
Date: Thu, 20 Feb 2014 15:54:52 +0200
Message-ID: <1392904492-11979-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The vic03 mux uses a linear mapping.

Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/clk/tegra/clk-tegra-periph.c |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra-periph.c b/drivers/clk/tegra/clk-tegra-periph.c
index f5376a3..1fa5c3f 100644
--- a/drivers/clk/tegra/clk-tegra-periph.c
+++ b/drivers/clk/tegra/clk-tegra-periph.c
@@ -371,9 +371,7 @@ static const char *mux_pllp3_pllc_clkm[] = {
 static const char *mux_pllm_pllc_pllp_plla_pllc2_c3_clkm[] = {
 	"pll_m", "pll_c", "pll_p", "pll_a", "pll_c2", "pll_c3", "clk_m"
 };
-static u32 mux_pllm_pllc_pllp_plla_pllc2_c3_clkm_idx[] = {
-	[0] = 0, [1] = 1, [2] = 2, [3] = 3, [4] = 4, [5] = 6,
-};
+#define mux_pllm_pllc_pllp_plla_pllc2_c3_clkm_idx NULL
 
 static const char *mux_pllm_pllc2_c_c3_pllp_plla_pllc4[] = {
 	"pll_m", "pll_c2", "pll_c", "pll_c3", "pll_p", "pll_a_out0", "pll_c4",
-- 
1.7.7.rc0.72.g4b5ea.dirty
