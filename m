From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v5 2/2] soc/tegra: pmc: Remove unnecessary memory barrier
Date: Thu, 26 Sep 2019 22:17:55 +0300
Message-ID: <20190926191755.27131-2-digetx@gmail.com>
References: <20190926191755.27131-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190926191755.27131-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

The removed barrier isn't needed because writes/reads are strictly ordered
and even if PMC had separate ports for writes, it wouldn't matter since
the hardware logic takes into effect after triggering CPU's power-gating
and at that point all CPU accesses are guaranteed to be completed. That
barrier was copied from the old arch/ code during transition to the soc/
PMC driver and even that the code structure was different back then, the
barrier didn't have a real useful purpose from the start. Lastly, the
tegra_pmc_writel() naturally inserts wmb() because it uses writel(),
and thus this change doesn't actually make any difference in terms of
interacting with hardware. Hence let's remove the barrier to clean up
code a tad.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---

Changelog:

v5: Extended the commit's message.

v4: No changes.

v3: No changes.

v2: New patch that was added after Jon's Hunter pointing that it's better
    not to change the barrier's placement in the code. In fact the barrier
    is not needed at all.

 drivers/soc/tegra/pmc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index ee39ded6bc7b..f75708a935ac 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -1463,8 +1463,6 @@ void tegra_pmc_enter_suspend_mode(enum tegra_suspend_mode mode)
 	do_div(ticks, USEC_PER_SEC);
 	tegra_pmc_writel(pmc, ticks, PMC_CPUPWROFF_TIMER);
 
-	wmb();
-
 	value = tegra_pmc_readl(pmc, PMC_CNTRL);
 	value &= ~PMC_CNTRL_SIDE_EFFECT_LP0;
 	value |= PMC_CNTRL_CPU_PWRREQ_OE;
-- 
2.23.0
