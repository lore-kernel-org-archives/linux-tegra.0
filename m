From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 3/4] memory: tegra: Replace readl-writel with mc_readl-mc_writel
Date: Fri, 12 Apr 2019 01:12:49 +0300
Message-ID: <20190411221250.23233-4-digetx@gmail.com>
References: <20190411221250.23233-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190411221250.23233-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

There is no need for a memory barriers on reading/writing of register
values as we only care about the read/write order, hence let's use the
common helpers.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/mc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index 89e463952b8a..31b47459c84d 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -288,24 +288,24 @@ static int tegra_mc_setup_latency_allowance(struct tegra_mc *mc)
 	tick = (unsigned long long)mc->tick * clk_get_rate(mc->clk);
 	do_div(tick, NSEC_PER_SEC);
 
-	value = readl(mc->regs + MC_EMEM_ARB_CFG);
+	value = mc_readl(mc, MC_EMEM_ARB_CFG);
 	value &= ~MC_EMEM_ARB_CFG_CYCLES_PER_UPDATE_MASK;
 	value |= MC_EMEM_ARB_CFG_CYCLES_PER_UPDATE(tick);
-	writel(value, mc->regs + MC_EMEM_ARB_CFG);
+	mc_writel(mc, value, MC_EMEM_ARB_CFG);
 
 	/* write latency allowance defaults */
 	for (i = 0; i < mc->soc->num_clients; i++) {
 		const struct tegra_mc_la *la = &mc->soc->clients[i].la;
 		u32 value;
 
-		value = readl(mc->regs + la->reg);
+		value = mc_readl(mc, la->reg);
 		value &= ~(la->mask << la->shift);
 		value |= (la->def & la->mask) << la->shift;
-		writel(value, mc->regs + la->reg);
+		mc_writel(mc, value, la->reg);
 	}
 
 	/* latch new values */
-	writel(MC_TIMING_UPDATE, mc->regs + MC_TIMING_CONTROL);
+	mc_writel(mc, MC_TIMING_UPDATE, MC_TIMING_CONTROL);
 
 	return 0;
 }
-- 
2.21.0
