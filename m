From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: [PATCH v4 4/4] soc/tegra: pmc: MBIST work around for Tegra210
Date: Thu, 25 Jan 2018 16:00:13 +0200
Message-ID: <1516888813-32180-5-git-send-email-pdeschrijver@nvidia.com>
References: <1516888813-32180-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1516888813-32180-1-git-send-email-pdeschrijver@nvidia.com>
Sender: linux-clk-owner@vger.kernel.org
To: jonathanh@nvidia.com, linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Apply the memory built-in self test work around when ungating certain
Tegra210 power domains.

Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index ce62a47..823087e 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -153,6 +153,7 @@ struct tegra_pmc_soc {
 
 	bool has_tsense_reset;
 	bool has_gpu_clamps;
+	bool needs_mbist_war;
 
 	const struct tegra_io_pad_soc *io_pads;
 	unsigned int num_io_pads;
@@ -431,6 +432,11 @@ static int tegra_powergate_power_up(struct tegra_powergate *pg,
 
 	usleep_range(10, 20);
 
+	if (pg->pmc->soc->needs_mbist_war)
+		err = tegra210_clk_handle_mbist_war(pg->id);
+	if (err)
+		goto disable_clks;
+
 	if (disable_clocks)
 		tegra_powergate_disable_clocks(pg);
 
@@ -1815,6 +1821,7 @@ static void tegra20_pmc_setup_irq_polarity(struct tegra_pmc *pmc,
 	.cpu_powergates = tegra210_cpu_powergates,
 	.has_tsense_reset = true,
 	.has_gpu_clamps = true,
+	.needs_mbist_war = true,
 	.num_io_pads = ARRAY_SIZE(tegra210_io_pads),
 	.io_pads = tegra210_io_pads,
 	.regs = &tegra20_pmc_regs,
-- 
1.9.1

