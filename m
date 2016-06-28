From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 1/6] soc/tegra: pmc: Ensure powergate is available when powering on
Date: Tue, 28 Jun 2016 11:38:23 +0100
Message-ID: <1467110308-22126-2-git-send-email-jonathanh@nvidia.com>
References: <1467110308-22126-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1467110308-22126-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

The function tegra_power_sequence_power_up() is a public function used
to power on a partition. When this function is called, we do not check
to see if the partition being powered up is valid/available. Fix this
by checking to see that the partition is valid/available.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 8a421a0b1ece..52a9e9703668 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -549,6 +549,9 @@ int tegra_powergate_sequence_power_up(unsigned int id, struct clk *clk,
 	struct tegra_powergate pg;
 	int err;
 
+	if (!tegra_powergate_is_available(id))
+		return -EINVAL;
+
 	pg.id = id;
 	pg.clks = &clk;
 	pg.num_clks = 1;
-- 
2.1.4
