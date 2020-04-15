From: Sasha Levin <sashal-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH AUTOSEL 4.19 03/40] clk: tegra: Fix Tegra PMC clock out parents
Date: Wed, 15 Apr 2020 07:45:46 -0400
Message-ID: <20200415114623.14972-3-sashal@kernel.org>
References: <20200415114623.14972-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200415114623.14972-1-sashal-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Sasha Levin <sashal-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

[ Upstream commit 6fe38aa8cac3a5db38154331742835a4d9740788 ]

Tegra PMC clocks clk_out_1, clk_out_2, and clk_out_3 supported parents
are osc, osc_div2, osc_div4 and extern clock.

Clock driver is using incorrect parents clk_m, clk_m_div2, clk_m_div4
for PMC clocks.

This patch fixes this.

Tested-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Reviewed-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Sasha Levin <sashal-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 drivers/clk/tegra/clk-tegra-pmc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra-pmc.c b/drivers/clk/tegra/clk-tegra-pmc.c
index a35579a3f884f..476dab494c44d 100644
--- a/drivers/clk/tegra/clk-tegra-pmc.c
+++ b/drivers/clk/tegra/clk-tegra-pmc.c
@@ -60,16 +60,16 @@ struct pmc_clk_init_data {
 
 static DEFINE_SPINLOCK(clk_out_lock);
 
-static const char *clk_out1_parents[] = { "clk_m", "clk_m_div2",
-	"clk_m_div4", "extern1",
+static const char *clk_out1_parents[] = { "osc", "osc_div2",
+	"osc_div4", "extern1",
 };
 
-static const char *clk_out2_parents[] = { "clk_m", "clk_m_div2",
-	"clk_m_div4", "extern2",
+static const char *clk_out2_parents[] = { "osc", "osc_div2",
+	"osc_div4", "extern2",
 };
 
-static const char *clk_out3_parents[] = { "clk_m", "clk_m_div2",
-	"clk_m_div4", "extern3",
+static const char *clk_out3_parents[] = { "osc", "osc_div2",
+	"osc_div4", "extern3",
 };
 
 static struct pmc_clk_init_data pmc_clks[] = {
-- 
2.20.1
