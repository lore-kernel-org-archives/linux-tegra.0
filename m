From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 3/4] clk: tegra: Correct bit width for PMC output clock mux
Date: Tue, 2 Aug 2016 11:34:28 +0100
Message-ID: <1470134069-12178-4-git-send-email-jonathanh@nvidia.com>
References: <1470134069-12178-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1470134069-12178-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The bit field for setting the clock mux for the PMC output clocks is a
2-bit field and has always been a 2-bit field for all Tegra devices that
have these clocks (starting with Tegra30). However, the PMC clock driver
incorrectly specifies that this bit field is 3 bits wide and this causes
other bits in the register to be over-written when setting up the mux.
Therefore, correct the width for PMC clock mux to prevent over-writing
other fields.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---

I did not bother marking this for stable because it has been around for
such a long time I don't think that this has caused any problems. I only
stumbled across this when dumping the register contents during some
testing. Nonetheless we should correct this.

 drivers/clk/tegra/clk-tegra-pmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra-pmc.c b/drivers/clk/tegra/clk-tegra-pmc.c
index 91377abfefa1..36469a2ca385 100644
--- a/drivers/clk/tegra/clk-tegra-pmc.c
+++ b/drivers/clk/tegra/clk-tegra-pmc.c
@@ -97,7 +97,7 @@ void __init tegra_pmc_clk_init(void __iomem *pmc_base,
 		clk = clk_register_mux(NULL, data->mux_name, data->parents,
 				data->num_parents, CLK_SET_RATE_NO_REPARENT,
 				pmc_base + PMC_CLK_OUT_CNTRL, data->mux_shift,
-				3, 0, &clk_out_lock);
+				2, 0, &clk_out_lock);
 		*dt_clk = clk;
 
 
-- 
2.1.4
