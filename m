From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 5.6 020/129] memory: tegra: Correct debugfs clk rate-range on Tegra124
Date: Wed, 15 Apr 2020 07:32:55 -0400
Message-ID: <20200415113445.11881-20-sashal@kernel.org>
References: <20200415113445.11881-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200415113445.11881-1-sashal@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <treding@nvidia.com>, Sasha Levin <sashal@kernel.org>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Dmitry Osipenko <digetx@gmail.com>

[ Upstream commit 141267bffd1dc19a76e4d50e3e4829f85a806875 ]

Correctly set clk rate-range if number of available timings is zero.
This fixes noisy "invalid range [4294967295, 0]" error messages during
boot.

Fixes: 6b9acd935546 ("memory: tegra: Refashion EMC debugfs interface on Tegra124")
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/memory/tegra/tegra124-emc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/memory/tegra/tegra124-emc.c b/drivers/memory/tegra/tegra124-emc.c
index 21f05240682b8..33b8216bac30c 100644
--- a/drivers/memory/tegra/tegra124-emc.c
+++ b/drivers/memory/tegra/tegra124-emc.c
@@ -1158,6 +1158,11 @@ static void emc_debugfs_init(struct device *dev, struct tegra_emc *emc)
 			emc->debugfs.max_rate = emc->timings[i].rate;
 	}
 
+	if (!emc->num_timings) {
+		emc->debugfs.min_rate = clk_get_rate(emc->clk);
+		emc->debugfs.max_rate = emc->debugfs.min_rate;
+	}
+
 	err = clk_set_rate_range(emc->clk, emc->debugfs.min_rate,
 				 emc->debugfs.max_rate);
 	if (err < 0) {
-- 
2.20.1
