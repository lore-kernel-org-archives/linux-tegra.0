From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v3 2/2] soc/tegra: pmc: Remove unnecessary memory barrier
Date: Tue, 30 Jul 2019 20:40:20 +0300
Message-ID: <20190730174020.15878-2-digetx@gmail.com>
References: <20190730174020.15878-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190730174020.15878-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

The removed barrier isn't needed because the writes/reads are strictly
ordered and even if PMC had separate ports for the writes, it wouldn't
matter since the hardware logic takes into effect after triggering CPU's
power-gating and at that point all CPU accesses are guaranteed to be
completed. Hence remove the barrier to eliminate the confusion.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---

Changelog:

v3: No changes.

v2: New patch that was added after Jon's Hunter pointing that it's better
    not to change the barrier's placement in the code. In fact the barrier
    is not needed at all.

 drivers/soc/tegra/pmc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index aba3396b2e73..3044809f1c10 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -1457,8 +1457,6 @@ void tegra_pmc_enter_suspend_mode(enum tegra_suspend_mode mode)
 	do_div(ticks, USEC_PER_SEC);
 	tegra_pmc_writel(pmc, ticks, PMC_CPUPWROFF_TIMER);
 
-	wmb();
-
 	value = tegra_pmc_readl(pmc, PMC_CNTRL);
 	value &= ~PMC_CNTRL_SIDE_EFFECT_LP0;
 	value |= PMC_CNTRL_CPU_PWRREQ_OE;
-- 
2.22.0
