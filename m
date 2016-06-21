From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] clk: tegra: Mark timer clock as critical
Date: Tue, 21 Jun 2016 17:30:35 +0200
Message-ID: <20160621153035.22172-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The timer clock feeds the timer block, which, among other things, is
used to drive the SOR lane sequencer. Since the Tegra timer driver is
not enabled on 64-bit ARM, nothing currently claims that clock and it
gets disabled by the common clock framework at late_init time.

Given the non-obvious dependencies, the timer clock can be considered
a critical part of the SoC infrastructure, requiring its clock source
to be always on.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/clk/tegra/clk-tegra-periph.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra-periph.c b/drivers/clk/tegra/clk-tegra-periph.c
index af85c8aeaf5a..4ce4e7fb1124 100644
--- a/drivers/clk/tegra/clk-tegra-periph.c
+++ b/drivers/clk/tegra/clk-tegra-periph.c
@@ -792,7 +792,7 @@ static struct tegra_periph_init_data periph_clks[] = {
 
 static struct tegra_periph_init_data gate_clks[] = {
 	GATE("rtc", "clk_32k", 4, TEGRA_PERIPH_ON_APB | TEGRA_PERIPH_NO_RESET, tegra_clk_rtc, 0),
-	GATE("timer", "clk_m", 5, 0, tegra_clk_timer, 0),
+	GATE("timer", "clk_m", 5, 0, tegra_clk_timer, CLK_IS_CRITICAL),
 	GATE("isp", "clk_m", 23, 0, tegra_clk_isp, 0),
 	GATE("vcp", "clk_m", 29, 0, tegra_clk_vcp, 0),
 	GATE("apbdma", "clk_m", 34, 0, tegra_clk_apbdma, 0),
-- 
2.8.3
