From: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH] clk/tegra: Fix mux typo, s/pll_m/clk_m/
Date: Wed, 10 Sep 2014 11:12:05 -0400
Message-ID: <1410361925-19739-1-git-send-email-seanpaul@chromium.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Fixes a typo in the mux_pllp_pllc_clkm table which had
pll_m instead of clk_m.

Signed-off-by: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 drivers/clk/tegra/clk-tegra-periph.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra-periph.c b/drivers/clk/tegra/clk-tegra-periph.c
index 37f32c4..d3d208d 100644
--- a/drivers/clk/tegra/clk-tegra-periph.c
+++ b/drivers/clk/tegra/clk-tegra-periph.c
@@ -303,7 +303,7 @@ static const char *mux_pllm_pllc_pllp_plla[] = {
 #define mux_pllm_pllc_pllp_plla_idx mux_pllp_pllc_pllm_clkm_idx
 
 static const char *mux_pllp_pllc_clkm[] = {
-	"pll_p", "pll_c", "pll_m"
+	"pll_p", "pll_c", "clk_m"
 };
 static u32 mux_pllp_pllc_clkm_idx[] = {
 	[0] = 0, [1] = 1, [2] = 3,
-- 
2.0.0
