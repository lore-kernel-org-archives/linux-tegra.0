From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 1/5] clk: tegra: emc: Don't enable EMC clock manually
Date: Fri, 12 Apr 2019 01:02:26 +0300
Message-ID: <20190411220230.21726-2-digetx@gmail.com>
References: <20190411220230.21726-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190411220230.21726-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Joseph Lo <josephl@nvidia.com>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

The EMC clock marked as critical, hence it is already enabled at the
registration time.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/clk/tegra/clk-emc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/tegra/clk-emc.c b/drivers/clk/tegra/clk-emc.c
index 0621a3a82ea6..23416982e7c7 100644
--- a/drivers/clk/tegra/clk-emc.c
+++ b/drivers/clk/tegra/clk-emc.c
@@ -532,7 +532,5 @@ struct clk *tegra_clk_register_emc(void __iomem *base, struct device_node *np,
 	/* Allow debugging tools to see the EMC clock */
 	clk_register_clkdev(clk, "emc", "tegra-clk-debug");
 
-	clk_prepare_enable(clk);
-
 	return clk;
 };
-- 
2.21.0
